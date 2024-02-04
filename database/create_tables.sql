-- Supprimer les tables existantes si elles existent déjà
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS choix;
DROP TABLE IF EXISTS utilisateurs;
DROP TABLE IF EXISTS historique;

-- Recréer la table parties avec une clé primaire auto-incrémentée
CREATE TABLE parties (
    partie_id INTEGER PRIMARY KEY AUTOINCREMENT,
    texte TEXT
);

-- Recréer la table choix avec une clé primaire auto-incrémentée et une clé étrangère vers la table parties
CREATE TABLE choix (
    choix_id INTEGER PRIMARY KEY AUTOINCREMENT,
    partie_id INTEGER,
    texte TEXT,
    image_url TEXT, -- Nouvelle colonne pour l'URL de l'image
    prochain_partie_id INTEGER,
    fin_jeu INTEGER DEFAULT 0, -- Champ pour indiquer si le choix mène à la fin du jeu
    FOREIGN KEY (partie_id) REFERENCES parties(partie_id)
);


-- Créer la table utilisateurs
CREATE TABLE utilisateurs (
    utilisateur_id INTEGER PRIMARY KEY AUTOINCREMENT,
    nom_utilisateur TEXT UNIQUE,
    mot_de_passe TEXT
);

-- Recréer la table historique avec une clé primaire auto-incrémentée
CREATE TABLE historique (
    historique_id INTEGER PRIMARY KEY AUTOINCREMENT,
    utilisateur_id INTEGER,
    partie_id INTEGER,
    choix TEXT,
    date_jouee TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (utilisateur_id) REFERENCES utilisateurs(utilisateur_id),
    FOREIGN KEY (partie_id) REFERENCES parties(partie_id)
);
