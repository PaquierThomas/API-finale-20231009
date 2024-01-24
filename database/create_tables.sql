-- Création de la table Utilisateurs pour stocker les comptes utilisateurs
CREATE TABLE IF NOT EXISTS Utilisateurs (
    user_id INTEGER PRIMARY KEY AUTOINCREMENT,
    username TEXT UNIQUE,
    password TEXT
);

-- Création de la table Montres pour stocker les informations sur les montres
CREATE TABLE IF NOT EXISTS ConfigurationsMontres (
    config_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    watch_name TEXT,
    case_id INTEGER,
    dial_id INTEGER,
    stones_id INTEGER,
    bracelet_id INTEGER,
    price REAL,
    FOREIGN KEY(user_id) REFERENCES Utilisateurs(user_id)
    -- Ajoutez des clés étrangères pour les composants et d'autres relations si nécessaire
);

-- Création de la table Panier pour stocker les paniers utilisateurs
CREATE TABLE IF NOT EXISTS Paniers (
    cart_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    cart_name TEXT,
    FOREIGN KEY(user_id) REFERENCES Utilisateurs(user_id)
);

-- Création de la table MontresDansLePanier pour relier les montres aux paniers
CREATE TABLE IF NOT EXISTS MontresDansLePanier (
    watch_cart_id INTEGER PRIMARY KEY AUTOINCREMENT,
    user_id INTEGER,
    config_id INTEGER,
    FOREIGN KEY(user_id) REFERENCES Utilisateurs(user_id),
    FOREIGN KEY(config_id) REFERENCES ConfigurationsMontres(config_id)
);

-- Création de la table Composants pour relier les montres aux paniers

CREATE TABLE Composants (
    component_id INTEGER PRIMARY KEY AUTOINCREMENT,
    watch_case TEXT,
    dial TEXT,
    stones TEXT,
    bracelet TEXT,
    metal_price REAL,
    leather_price REAL,
    fabric_price REAL
);
