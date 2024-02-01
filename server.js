const express = require("express");
const sqlite3 = require("sqlite3");
const bodyParser = require("body-parser");
const cors = require("cors");

const app = express();
const port = 4000;

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

app.get("/", (req, res) => {
  res.redirect("/test");
});

app.get("/help-contact", (req, res) => {
  res.sendFile(__dirname + "/help-contact.html");
});
app.get("/api/histoire/:partieId/choix/:choixId", (req, res) => {
  const { partieId, choixId } = req.params;

  const sql = `
    SELECT p.texte AS partie_texte, c.choix_id, c.texte AS choix_texte, c.prochain_partie_id
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
    }));

    res.json({
      texte: partieTexte,
      choix: choix,
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

app.listen(port, () => {
  console.log(`Server is running on port http://localhost:${port}`);
});
