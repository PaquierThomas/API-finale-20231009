-- Ajout d'exemples d'utilisateurs
INSERT INTO Utilisateurs (username, password) VALUES ('thomas', 'test');
INSERT INTO Utilisateurs (username, password) VALUES ('emma', 'test');
INSERT INTO Utilisateurs (username, password) VALUES ('william', 'test');

-- Ajout d'exemples de montres pour Thomas
INSERT INTO Montres (user_id, watch_name, case_id, dial_id, stones_id, bracelet_id, price)
VALUES (1, 'Montre Classique', 1, 1, 2, 3, 1000.0);

INSERT INTO Montres (user_id, watch_name, case_id, dial_id, stones_id, bracelet_id, price)
VALUES (1, 'Montre Sportive', 2, 3, 1, 2, 1200.0);

INSERT INTO Montres (user_id, watch_name, case_id, dial_id, stones_id, bracelet_id, price)
VALUES (1, 'Montre Élégante', 3, 2, 1, 1, 900.0);

-- Ajout d'exemples de montres pour Emma
INSERT INTO Montres (user_id, watch_name, case_id, dial_id, stones_id, bracelet_id, price)
VALUES (2, 'Montre Décontractée', 3, 2, 1, 1, 900.0);

-- Ajout d'exemples de montres pour William
INSERT INTO Montres (user_id, watch_name, case_id, dial_id, stones_id, bracelet_id, price)
VALUES (3, 'Montre Sportive', 2, 3, 1, 2, 1200.0);

-- Ajout d'exemples de paniers
INSERT INTO Panier (user_id, cart_name) VALUES (1, 'Panier de Thomas');
INSERT INTO Panier (user_id, cart_name) VALUES (2, "Panier d'Emma");
INSERT INTO Panier (user_id, cart_name) VALUES (3, 'Panier de William');

-- Ajout d'exemples de montres dans les paniers
INSERT INTO MontresDansLePanier (cart_id, watch_id)
VALUES (1, 1);  -- Montre dans le panier de Thomas

INSERT INTO MontresDansLePanier (cart_id, watch_id)
VALUES (2, 2);  -- Montre dans le panier d'Emma

INSERT INTO MontresDansLePanier (cart_id, watch_id)
VALUES (3, 3);  -- Montre dans le panier de William


-- Ajout d'exemples de montres avec leurs composants
INSERT INTO Montres (watch_name, case, dial, stones, bracelet, metal_price, leather_price, fabric_price)
VALUES ('Montre Élégante', 'boitier1', 'cadran1', 'rubis', 'metal', 100.0, 120.0, 80.0);

INSERT INTO Montres (watch_name, case, dial, stones, bracelet, metal_price, leather_price, fabric_price)
VALUES ('Montre Sportive', 'boitier2', 'cadran2', 'diamant', 'cuir', 150.0, 180.0, 120.0);

INSERT INTO Montres (watch_name, case, dial, stones, bracelet, metal_price, leather_price, fabric_price)
VALUES ('Montre Décontractée', 'boitier3', 'cadran3', 'emeraude', 'tissus', 120.0, 150.0, 100.0);

INSERT INTO Montres (watch_name, case, dial, stones, bracelet, metal_price, leather_price, fabric_price)
VALUES ('Montre Classique', 'boitier4', 'cadran4', 'saphir', 'metal', 110.0, 130.0, 90.0);

INSERT INTO Montres (watch_name, case, dial, stones, bracelet, metal_price, leather_price, fabric_price)
VALUES ('Montre Chic', 'boitier5', 'cadran5', 'topaze', 'cuir', 160.0, 190.0, 130.0);

