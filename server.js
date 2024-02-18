const express = require("express");
const sqlite3 = require("sqlite3");
const bodyParser = require("body-parser");
const cors = require("cors");
const jwt = require("jsonwebtoken");
const cookieParser = require("cookie-parser");

const app = express();
const port = 4000;
app.use(express.json());
app.use(cookieParser());

app.use(
  cors({
    origin: "http://localhost:4321",
    credentials: true,
  })
);

app.use(bodyParser.json());

const db = new sqlite3.Database("./database/ProjetS6.db", (err) => {
  if (err) {
    console.error("Error connecting to the database:", err.message);
  } else {
    console.log("Connected to the database");
  }
});
// Endpoint pour l'inscription
app.post("/api/register", (req, res) => {
  const { username, password } = req.body;

  // Vérifier si le nom d'utilisateur est déjà utilisé
  const checkUserQuery =
    "SELECT COUNT(*) AS count FROM utilisateurs WHERE nom_utilisateur = ?";
  db.get(checkUserQuery, [username], (err, row) => {
    if (err) {
      console.error(
        "Erreur lors de la vérification du nom d'utilisateur :",
        err
      );
      return res.status(500).json({ error: "Erreur interne du serveur" });
    }

    if (row.count > 0) {
      // Le nom d'utilisateur est déjà utilisé
      return res
        .status(400)
        .json({ message: "Ce nom d'utilisateur est déjà pris" });
    }

    // Insérer un nouvel utilisateur dans la base de données
    const insertUserQuery =
      "INSERT INTO utilisateurs (nom_utilisateur, mot_de_passe) VALUES (?, ?)";
    db.run(insertUserQuery, [username, password], (err) => {
      if (err) {
        console.error("Erreur lors de l'insertion de l'utilisateur :", err);
        return res.status(500).json({ error: "Erreur interne du serveur" });
      }

      // Utilisateur inscrit avec succès
      res.status(201).json({ message: "Inscription réussie" });
    });
  });
});

// Route API pour récupérer les parties jouées par l'utilisateur connecté
app.get("/api/user-parties", authMiddleware, (req, res) => {
  if (!req.utilisateur) {
    return res
      .status(401)
      .json({ message: "L'utilisateur n'est pas authentifié." });
  }

  const userId = req.utilisateur.utilisateur_id; // Obtenez l'ID de l'utilisateur connecté à partir du jeton JWT
  // Sélectionnez les parties jouées par l'utilisateur connecté à partir de la base de données
  db.all(
    "SELECT * FROM historique WHERE utilisateur_id = ?",
    [userId],
    (err, rows) => {
      if (err) {
        console.error("Erreur lors de la récupération des parties :", err);
        res.status(500).json({
          message:
            "Erreur lors de la récupération des parties jouées par l'utilisateur.",
        });
        return;
      }
      res.json({ parties: rows });
    }
  );
});

// Middleware pour vérifier l'authentification de l'utilisateur
function authMiddleware(req, res, next) {
  // Vérifier si le jeton JWT est présent dans les cookies

  const token = req.cookies.jwt;

  if (token) {
    jwt.verify(token, "votre_secret_key", (err, decodedToken) => {
      if (err) {
        console.error("Erreur lors de la vérification du jeton :", err);
        res.clearCookie("jwt");
        next();
      } else {
        // Jeton valide, ajouter les informations d'identification à l'objet de requête
        req.utilisateur = decodedToken; // Stocker toutes les informations de l'utilisateur
        next();
      }
    });
  } else {
    next();
  }
}

app.post("/api/ajouter-partie-historique", authMiddleware, (req, res) => {
  // Vérifier si l'utilisateur est authentifié avant d'ajouter la partie à l'historique
  console.log(req.body);
  console.log(req.utilisateur);
  if (!req.utilisateur) {
    return res
      .status(401)
      .json({ message: "L'utilisateur n'est pas authentifié." });
  }
  const userId = req.utilisateur.utilisateur_id; // Obtenez l'ID de l'utilisateur connecté à partir du jeton JWT
  const { partie_id, choix } = req.body; // Ajoutez la récupération des choix depuis le corps de la requête

  // Ajoutez la partie à l'historique de l'utilisateur dans la base de données avec les choix
  db.run(
    "INSERT INTO historique (utilisateur_id, partie_id, choix) VALUES (?, ?, ?)", // Modifiez la requête pour inclure les données de choix
    [userId, partie_id, choix], // Ajoutez les données de choix dans les valeurs à insérer dans la base de données
    (err) => {
      if (err) {
        console.error(
          "Erreur lors de l'ajout de la partie à l'historique :",
          err
        );
        return res.status(500).json({
          message:
            "Erreur lors de l'ajout de la partie à l'historique de l'utilisateur.",
        });
      }
      res.json({
        message: "Partie ajoutée à l'historique de l'utilisateur avec succès.",
      });
    }
  );
});

// SELECT c.texte AS choix_texte, p.texte AS partie_texte
//       FROM choix c
//       JOIN parties p ON c.prochain_partie_id = p.partie_id
//       WHERE p.partie_id = ?;

// Route API pour récupérer les statistiques des choix pour chaque embranchement
app.get("/api/stats-embranchements", (req, res) => {
  // Requête SQL pour récupérer tous les embranchements distincts présents dans la table choix

  db.all("SELECT partie_id, choix FROM historique", (err, results) => {
    if (err) {
      console.error(err);
      return;
    }

    const choices = results
      .map((r) => JSON.parse(r.choix))
      .flat()
      .reduce(
        (acc, curr) => ({
          ...acc,
          [curr]: (acc[curr] || 0) + 1,
        }),
        {}
      );

    db.all(
      "SELECT parties.partie_id, parties.texte AS partie_text, json_object('ids', json_group_array(choix.choix_id), 'textes', json_group_array(choix.texte)) AS choix FROM parties LEFT JOIN choix ON parties.partie_id = choix.partie_id GROUP BY parties.partie_id",
      (err, parties) => {
        if (err) {
          console.error(err);
          return;
        }

        const results = parties.map((p) => {
          const parsedChoix = JSON.parse(p.choix);

          const choix = parsedChoix.ids.map((id, index) => ({
            id,
            text: parsedChoix.textes[index],
            total: choices[id] || 0,
          }));

          return {
            ...p,
            choix,
            totalChoix: choix.reduce((acc, curr) => acc + curr.total, 0),
          };
        });
        return res.status(200).json(results);
      }
    );
  });
});

// Endpoint pour l'authentification
app.post("/api/login", (req, res) => {
  const { username, password } = req.body;

  // Requête pour vérifier les informations d'identification dans la base de données
  const sql = `
        SELECT *
        FROM utilisateurs
        WHERE nom_utilisateur = ? AND mot_de_passe = ?;
    `;

  db.get(sql, [username, password], (err, row) => {
    if (err) {
      console.error(
        "Erreur lors de la vérification des informations d'identification :",
        err
      );
      return res.status(500).json({ error: "Erreur interne du serveur" });
    }

    if (!row) {
      // Si les informations d'identification sont incorrectes
      return res
        .status(401)
        .json({ message: "Nom d'utilisateur ou mot de passe incorrect" });
    }

    // Utilisateur trouvé, créer un jeton JWT
    const token = jwt.sign(
      { utilisateur_id: row.utilisateur_id },
      "votre_secret_key"
    );

    // Envoyer le jeton en tant que cookie
    res.cookie("jwt", token, { httpOnly: true });

    // Si les informations d'identification sont correctes
    res.status(200).json({ message: "Connexion réussie" });
  });
});

// Endpoint pour vérifier l'état de connexion
app.get("/api/verify-login", authMiddleware, (req, res) => {
  // Si l'utilisateur est connecté, renvoyer ses informations d'identification
  if (req.utilisateur) {
    // Requête pour récupérer toutes les informations de l'utilisateur depuis la base de données
    const sql = `
      SELECT *
      FROM utilisateurs
      WHERE utilisateur_id = ?
    `;

    db.get(sql, [req.utilisateur.utilisateur_id], (err, row) => {
      if (err) {
        console.error(
          "Erreur lors de la récupération des informations de l'utilisateur :",
          err
        );
        return res.status(500).json({ error: "Erreur interne du serveur" });
      }

      if (!row) {
        return res.status(404).json({ message: "Utilisateur non trouvé" });
      }

      // Envoyer toutes les informations de l'utilisateur vers le client
      res.status(200).json({ utilisateur: row });
    });
  } else {
    res.status(401).json({ message: "Utilisateur non connecté" });
  }
});

// Endpoint pour se déconnecter
app.post("/api/logout", (req, res) => {
  console.log("Tentative de déconnexion...");
  res.clearCookie("jwt");
  console.log("Cookie supprimé.");
  res.status(200).json({ message: "Déconnexion réussie" });
  console.log("Réponse envoyée avec succès.");
});

app.get("/", (req, res) => {
  res.redirect("/test");
});

app.get("/help-contact", (req, res) => {
  res.sendFile(__dirname + "/help-contact.html");
});
app.get("/api/histoire/:partieId/choix/:choixId", (req, res) => {
  const { partieId, choixId } = req.params;

  const sql = `
      SELECT p.texte AS partie_texte, c.choix_id, c.texte AS choix_texte, c.prochain_partie_id, c.fin_jeu, c.image_url
      FROM parties p
      JOIN choix c ON p.partie_id = c.partie_id
      WHERE p.partie_id = ?;
    `;

  db.all(sql, [partieId], (err, rows) => {
    if (err) {
      console.error("Error retrieving data from the database:", err);
      return res.status(500).json({ error: "Internal server error" });
    }

    if (rows.length === 0) {
      return res.status(404).json({ message: "Data not found" });
    }

    const partieTexte = rows[0].partie_texte;
    const choix = rows.map((row) => ({
      id: row.choix_id,
      texte: row.choix_texte,
      prochain_partie_id: row.prochain_partie_id,
      fin_jeu: row.fin_jeu,
      image_url: row.image_url, // Ajout du champ image_url
    }));

    // Vérifier si le choix actuel mène à la fin du jeu
    const choixActuel = choix.find((c) => c.id === parseInt(choixId));
    if (choixActuel && choixActuel.fin_jeu === 1) {
      // Redirection vers la page de fin de jeu
      return res.redirect("/api/fin-jeu");
    }

    res.json({
      texte: partieTexte,
      choix: choix,
    });
  });
});

app.get("/api/fin-jeu/:partieId", (req, res) => {
  // Modifier le nom du paramètre de :choixId à :partieId
  const { partieId } = req.params; // Utiliser partieId au lieu de choixId

  const sql = `
      SELECT c.texte AS choix_texte, p.texte AS partie_texte
      FROM choix c
      JOIN parties p ON c.prochain_partie_id = p.partie_id
      WHERE p.partie_id = ?; 
    `;

  db.get(sql, [partieId], (err, row) => {
    if (err) {
      console.error("Error retrieving end game data from the database:", err);
      return res.status(500).json({ error: "Internal server error" });
    }

    if (!row) {
      return res.status(404).json({ message: "Data not found" });
    }

    res.json({
      choix_texte: row.choix_texte,
      partie_texte: row.partie_texte,
    });
  });
});

// Endpoint pour récupérer les données des parties
app.get("/api/parties", (req, res) => {
  const sql = "SELECT * FROM parties";

  db.all(sql, (err, rows) => {
    if (err) {
      console.error("Error retrieving parties data:", err);
      return res.status(500).json({ error: "Internal server error" });
    }

    res.status(200).json(rows);
  });
});

// Endpoint pour récupérer les données des choix
app.get("/api/choix", (req, res) => {
  const sql = "SELECT * FROM choix";

  db.all(sql, (err, rows) => {
    if (err) {
      console.error("Error retrieving choix data:", err);
      return res.status(500).json({ error: "Internal server error" });
    }

    res.status(200).json(rows);
  });
});

app.get("/api/fin-jeu", (req, res) => {
  // Logique pour indiquer que le jeu est terminé
  res.status(200).json({ message: "Le jeu est terminé. Vous êtes mort !" });
});

app.listen(port, () => {
  console.log(`Server is running on port http://localhost:${port}`);
});
