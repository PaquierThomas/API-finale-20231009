const express = require("express");
const sqlite3 = require("sqlite3");
const bodyParser = require("body-parser"); // for parsing JSON requests
const jwt = require("jsonwebtoken");
const bcrypt = require("bcrypt");

const cors = require("cors");

const app = express();
const port = 4000;

app.use(
  cors({
    origin: "http://localhost:5173", // Remplacez ceci par l'URL de votre front-end
    credentials: true, // Si vous utilisez des cookies ou des en-têtes d'autorisation
  })
);

// Middleware for parsing JSON requests
app.use(bodyParser.json());

// Connect to your SQLite database
const db = new sqlite3.Database("./database/DB_MontreSAE.db", (err) => {
  if (err) {
    console.error("Error connecting to the database:", err.message);
  } else {
    console.log("Connected to the database");
  }
});

// Define the API endpoints
// Redirect the home to all montres
app.get("/", (req, res) => {
  res.redirect("/test");
});

// Define a route for help and contact
app.get("/help-contact", (req, res) => {
  // The HTML file will be served automatically from the 'public' directory
  res.sendFile(__dirname + "/help-contact.html");
});

app.post("/signup", (req, res) => {
  const { username, password } = req.body;
  // Assurez-vous que le nom d'utilisateur n'existe pas déjà dans la base de données
  // Si le nom d'utilisateur est unique, ajoutez-le à la base de données
  db.run(
    "INSERT INTO Utilisateurs (username, password) VALUES (?, ?)",
    [username, password],
    function (err) {
      if (err) {
        console.error("Error creating new account:", err.message);
        res.status(500).json({ error: "Internal server error" });
        return;
      }
      const user_id = this.lastID; // Récupérer l'ID du nouvel utilisateur inséré
      res
        .status(201)
        .json({ message: "Account created successfully", user_id });
    }
  );
});

app.post("/login", async (req, res) => {
  const { username, password } = req.body;

  db.get(
    "SELECT * FROM Utilisateurs WHERE username = ?",
    [username],
    async (err, row) => {
      if (err) {
        res.status(500).json({ error: "Internal server error" });
      } else if (!row) {
        res.status(401).json({ error: "Invalid credentials" });
      } else {
        // Comparaison du mot de passe en texte brut
        if (password === row.password) {
          // Vous avez reçu la réponse du serveur pour une connexion réussie
          res.status(200).json({ user_id: row.user_id, token: row.user_id });
        } else {
          res.status(401).json({ error: "Invalid credentials" });
        }
      }
    }
  );
});

// // Toutes les montres avec toutes leurs données
// app.get("/montres", (req, res) => {
//   // Récupérer toutes les données des montres depuis la base de données ou une autre source
//   db.all("SELECT * FROM ConfigurationsMontres", (err, rows) => {
//     if (err) {
//       console.error("Erreur lors de la récupération des montres :", err);
//       res.status(500).json({ error: "Erreur interne du serveur" });
//       return;
//     }

//     res.status(200).json({ montres: rows });
//   });
// });

app.get("/montres/:configId", (req, res) => {
  const configId = req.params.configId;

  const query = `
    SELECT
      cm.config_id, 
      cm.watch_name, 
      co.watch_case AS case_name,
      co.dial AS dial_name,
      co.stones AS stones_name,
      co.bracelet AS bracelet_name,
      co.metal_price,
      co.leather_price,
      co.fabric_price,
      cm.price
    FROM ConfigurationsMontres cm
    JOIN Composants co ON cm.case_id = co.component_id
    WHERE cm.config_id = ?; 
  `;

  db.get(query, [configId], (err, row) => {
    if (err) {
      console.error(
        "Erreur lors de la récupération des détails de la montre:",
        err
      );
      res.status(500).json({ error: "Erreur interne du serveur" });
      return;
    }

    if (!row) {
      res.status(404).json({ error: "Montre non trouvée" });
      return;
    }

    res.status(200).json(row); // Retourne les détails de la montre, y compris les pierres précieuses
  });
});

app.post("/panier/add", (req, res) => {
  const { config_id } = req.body;
  const user_id = req.headers.authorization; // Supposons que tu stockes l'ID utilisateur dans le header Authorization après l'authentification

  console.log("user_id:", user_id);
  console.log("config_id:", config_id);

  if (!user_id) {
    return res.status(401).json({ error: "Utilisateur non connecté" });
  }

  // Ajoute la montre avec l'ID spécifié au panier de l'utilisateur
  db.run(
    "INSERT INTO MontresDansLePanier (user_id, config_id) VALUES (?, ?)",
    [user_id, config_id],
    function (err) {
      if (err) {
        console.error("Erreur lors de l'ajout au panier:", err.message);
        return res.status(500).json({ error: "Erreur interne du serveur" });
      }

      // Récupère le user_id après l'insertion
      const user_id = this.lastID;

      res.status(201).json({ message: "Montre ajoutée au panier", user_id });
    }
  );
});
app.get("/api/panier/:userId", (req, res) => {
  const userId = req.params.userId;

  console.log("user_id:", userId);

  if (!userId) {
    return res.status(401).json({ error: "Utilisateur non connecté" });
  }

  const sql = `
    SELECT
      MP.watch_cart_id AS PanierID,
      CM.watch_name AS NomMontre,
      C.watch_case AS NomBoitier,
      C.dial AS TextureBoitier,
      (C.metal_price + C.leather_price + C.fabric_price) AS PrixTotal
    FROM
      MontresDansLePanier MP
    JOIN
      ConfigurationsMontres CM ON MP.config_id = CM.config_id
    JOIN
      Composants C ON CM.case_id = C.component_id
    WHERE
      MP.user_id = ?
  `;

  db.all(sql, [userId], (err, rows) => {
    if (err) {
      console.error("Erreur lors de la récupération du panier:", err.message);
      return res.status(500).json({ error: "Erreur interne du serveur" });
    }

    res.status(200).json(rows);
  });
});

app.delete("/api/panier/:userId", (req, res) => {
  const user_id = req.params.userId;

  if (!user_id) {
    return res.status(401).json({ error: "Utilisateur non connecté" });
  }

  const sql = `DELETE FROM MontresDansLePanier WHERE user_id = ?`;

  db.run(sql, [user_id], (err) => {
    if (err) {
      console.error("Erreur lors de la suppression du panier:", err.message);
      return res.status(500).json({ error: "Erreur interne du serveur" });
    }

    res.status(200).json({ message: "Panier supprimé avec succès." });
  });
});

// Endpoint pour mettre à jour une configuration de montre par config_id

app.put("/montres/:configId", (req, res) => {
  const configId = req.params.configId;
  const updatedConfig = req.body;

  let setClause = "";
  const values = [];

  // Parcourt les champs modifiés pour construire la clause SET dynamiquement
  for (const key in updatedConfig) {
    if (updatedConfig[key] !== null && updatedConfig[key] !== undefined) {
      setClause += `${key} = ?, `;
      values.push(updatedConfig[key]);
    }
  }

  // Supprime la virgule finale de la clause SET
  setClause = setClause.slice(0, -2);

  // S'il y a des champs modifiés
  if (setClause) {
    const query = `
      UPDATE ConfigurationsMontres
      SET ${setClause}
      WHERE config_id = ?;
    `;
    values.push(configId);

    db.run(query, values, function (err) {
      if (err) {
        console.error(
          "Erreur lors de la mise à jour de la configuration :",
          err
        );
        res.status(500).json({ error: "Erreur interne du serveur" });
        return;
      }

      res
        .status(200)
        .json({ message: "Configuration mise à jour avec succès" });
    });
  } else {
    // Aucun champ modifié
    res.status(400).json({ message: "Aucune modification détectée" });
  }
});

app.delete("/montres/:configId", (req, res) => {
  const configId = req.params.configId;

  const query = `
    DELETE FROM ConfigurationsMontres
    WHERE config_id = ?;
  `;

  db.run(query, [configId], function (err) {
    if (err) {
      console.error("Erreur lors de la suppression de la configuration :", err);
      res.status(500).json({ error: "Erreur interne du serveur" });
      return;
    }

    res.status(200).json({ message: "Configuration supprimée avec succès" });
  });
});

app.get("/montres", (req, res) => {
  const query = `
    SELECT 
      cm.config_id, 
      cm.watch_name, 
      co.watch_case AS case_name,
      co.dial AS dial_name,
      co.stones AS stones_name,
      co.bracelet AS bracelet_name,
      co.metal_price,
      co.leather_price,
      co.fabric_price,
      cm.price
    FROM ConfigurationsMontres cm
    JOIN Composants co ON cm.case_id = co.component_id
  `;

  db.all(query, (err, rows) => {
    if (err) {
      console.error(
        "Erreur lors de la récupération des montres et composants :",
        err
      );
      res.status(500).json({ error: "Erreur interne du serveur" });
      return;
    }

    res.status(200).json({ montres: rows });
  });
});

// Avoir toutes les montres des utilisateurs
app.get("/montres", (req, res) => {
  // Sélectionner toutes les montres de tous les utilisateurs avec leurs informations
  const query = `
    SELECT Utilisateurs.username, ConfigurationsMontres.watch_name
    FROM Utilisateurs
    JOIN ConfigurationsMontres ON Utilisateurs.user_id = ConfigurationsMontres.user_id
  `;

  db.all(query, (err, rows) => {
    if (err) {
      console.error("Erreur lors de la récupération des montres :", err);
      res.status(500).json({ error: "Erreur interne du serveur" });
      return;
    }

    // Structurez les données pour afficher par utilisateur
    const usersWatches = {};
    rows.forEach((row) => {
      if (!usersWatches[row.username]) {
        usersWatches[row.username] = [];
      }
      usersWatches[row.username].push(row.watch_name);
    });

    // Envoyer les montres récupérées par utilisateur en tant que réponse
    res.status(200).json({ watchesByUser: usersWatches });
  });
});

app.post("/add-watch", (req, res) => {
  const { userId, watchName, caseId, dialId, stonesId, braceletId, price } =
    req.body;

  db.run(
    "INSERT INTO ConfigurationsMontres (user_id, watch_name, case_id, dial_id, stones_id, bracelet_id, price) VALUES (?, ?, ?, ?, ?, ?, ?)",
    [userId, watchName, caseId, dialId, stonesId, braceletId, price],
    (err) => {
      if (err) {
        console.error("Error adding new watch:", err.message);
        res.status(500).json({ error: "Internal server error" });
        return;
      }
      res.status(201).json({ message: "Watch added successfully" });
    }
  );
});

// Start the server
app.listen(port, () => {
  console.log(`Server is running on port http://localhost:${port}`);
});
