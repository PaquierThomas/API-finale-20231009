-- Insérer des données d'exemple dans la table utilisateurs
INSERT INTO utilisateurs (nom_utilisateur, mot_de_passe) VALUES
    ('aurélie', '1234'),
    ('thomas', 'thomas2'),
    ('test', 'test'),
    ('b','b');

-- Insérer des données d'historique pour l'utilisateur 4

INSERT INTO historique (utilisateur_id, partie_id, choix) VALUES 
(4, 1, '[2,5,9,15,21,27,33,39]'), 
(4, 3, '[2,6,13,19,26,2,5,9,15,21,27,33,39]'),
(4, 2, '[2,5,9,15,21,27,33,39]'),
(4, 4, '[2,6,13,19,25,31,37,38,1,3,7,11,1,3,7,11,2,5,9,15,21,27,33,39]');



-- Réinsérer les données dans la table parties avec une clé primaire auto-incrémentée
INSERT INTO parties (texte) VALUES
    ('Vous vous tenez devant deux portes. Une à gauche et une à droite. Laquelle choisissez-vous ?'),
    ('Vous entrez dans une pièce sombre. Il y a une torche sur le mur. La prenez-vous ?'),
    ('Vous allumez la torche et avancez dans la pièce. Vous voyez un coffre au fond. Ouvrez-vous le coffre ?'),
    ('Vous avancez dans l''obscurité. Soudain, vous trébuchez sur quelque chose et tombez. Vous vous blessez légèrement.'),
    ('Le coffre est rempli de pièces d''or ! Vous les ramassez et continuez votre aventure.'),
    ('En ignorant le coffre, vous continuez votre chemin. Rien d''intéressant n''arrive par la suite.'),
    ('Vous avez trouvé une carte au trésor dans le coffre ! Elle vous guide vers de nouvelles aventures.'),
    ('Vous vous trouvez face à un passage étroit. Essayez-vous de le traverser ?'),
    ('Vous découvrez un escalier qui descend dans l''obscurité. Descendez-vous ?'),
    ('Vous entendez un bruit étrange derrière vous. Vous retournez voir ce que c''est.'),
    ('Vous trouvez une clé rouillée par terre. La prenez-vous ?'),
    ('Vous découvrez une trappe secrète sous un tapis. L''ouvrez-vous ?'),
    ('Vous trouvez une potion mystérieuse dans un coin de la pièce. La buvez-vous ?'),
    ('Vous croisez un vieux sage assis au coin du feu. Lui parlez-vous ?'),
    ('Vous entendez des voix chuchoter dans l''obscurité. Cherchez-vous d''où elles viennent ?'),
    ('Vous découvrez un parchemin ancien sur une étagère. Le prenez-vous ?'),
    ('Vous trouvez une épée rouillée abandonnée par terre. La ramassez-vous ?'),
    ('Vous trouvez une porte secrète dissimulée derrière un tableau. L''ouvrez-vous ?'),
    ('Vous rencontrez un marchand ambulant. Regardez-vous ses marchandises ?'),
    ('Vous apercevez une lueur au bout du couloir. Vous dirigez-vous vers elle ?'),
    ('Vous êtes tombés dans un piège. Vous êtes morts.'),
    ('Vous avez bu de la javel ! Vous avez gagné !');


-- Réinsérer les données dans la table choix avec les clés étrangères correctes vers la table parties
INSERT INTO choix (partie_id, texte, image_url, prochain_partie_id, fin_jeu) VALUES
    (1, 'Porte de gauche', 'robot.png', 2, 0),
    (1, 'Porte de droite', 'alien.png', 3, 0),
    (2, 'Prendre la torche', 'student.png', 4, 0),
    (2, 'Continuer sans la torche', 'alien.png', 5, 0),
    (3, 'Ouvrir le coffre', 'robot.png', 5, 0),
    (3, 'Ignorer le coffre', 'student.png', 7, 0),
    (4, 'Se relever et continuer', 'student.png', 6, 0),
    (4, 'Revenir sur ses pas', 'alien.png', 1, 0),
    (5, 'Continuer l''aventure avec les pièces d''or', 'robot.png', 8, 0),
    (5, 'Rebrousser chemin', 'alien.png', 1, 0),
    (6, 'Continuer votre chemin', 'robot.png', 1, 0),
    (6, 'Explorer la pièce', 'student.png', 9, 0),
    (7, 'Suivre la carte au trésor', 'robot.png', 10, 0),
    (7, 'Ignorer la carte et continuer', 'alien.png', 1, 0),
    (8, 'Tenter de passer', 'robot.png', 11, 0),
    (8, 'Revenir en arrière', 'alien.png', 1, 0),
    (9, 'Descendre l''escalier', 'robot.png', 12, 0),
    (9, 'Revenir à la pièce précédente', 'alien.png', 1, 0),
    (10, 'Investiguer le bruit', 'robot.png', 13, 0),
    (10, 'Continuer votre route', 'alien.png', 1, 0),
    (11, 'Prendre la clé', 'robot.png', 14, 0),
    (11, 'Ignorer la clé', 'alien.png', 1, 0),
    (12, 'Continuer à descendre', 'robot.png', 15, 0),
    (12, 'Remonter à la surface', 'alien.png', 1, 0),
    (13, 'Chercher la source du bruit', 'robot.png', 16, 0),
    (13, 'Fuir la pièce', 'alien.png', 1, 0),
    (14, 'Ouvrir la trappe', 'robot.png', 17, 0),
    (14, 'Laisser la trappe fermée', 'alien.png', 1, 0),
    (15, 'Explorer les souterrains', 'robot.png', 18, 0),
    (15, 'Revenir à la surface', 'alien.png', 1, 0),
    (16, 'Investiguer la pièce', 'robot.png', 19, 0),
    (16, 'Revenir sur vos pas', 'alien.png', 1, 0),
    (17, 'Boire la potion', 'robot.png', 20, 0),
    (17, 'Jeter la potion', 'alien.png', 1, 0),
    (18, 'Parler au sage', 'robot.png', 21, 0),
    (18, 'Ignorer le sage', 'alien.png', 1, 0),
    (19, 'Tenter de comprendre les voix', 'robot.png', 22, 0),
    (19, 'Quitter la pièce', 'alien.png', 1, 0),
    (20, 'Prendre le parchemin', 'robot.png', 21, 1),
    (20, 'Laisser le parchemin', 'alien.png', 22, 1),
    (20, 'Laisser le parchemin', 'alien.png', 22, 1),
    (21, 'Recommencer la partie', 'robot.png', 1, 0);


