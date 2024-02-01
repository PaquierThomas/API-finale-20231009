-- Supprimer les tables existantes si elles existent déjà
DROP TABLE IF EXISTS parties;
DROP TABLE IF EXISTS choix;

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
    prochain_partie_id INTEGER,
    FOREIGN KEY (partie_id) REFERENCES parties(partie_id)
);
