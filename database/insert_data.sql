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



INSERT INTO parties (texte) VALUES
-- 1
('Alors que Dylan étudiait tranquillement dans la bibliothèque de son école, plongé dans ses livres, il fut interrompu par un bruit étrange provenant du hangar adjacent. Curieux, il se leva pour aller jeter un coup d''œil.'),
-- 2
('En s''approchant du hangar, Dylan distingua une silhouette furtive se faufilant dans l''ombre. Son instinct lui souffla de s''en approcher pour voir ce qui se passait.'),
-- 3
('Dylan découvrit XB-3, le robot fuyant, dissimulé derrière une pile de caisses dans le hangar. Ses circuits semblaient frétiller d''angoisse. Dylan sentit son cœur se serrer devant la détresse de cette créature artificielle.'),
-- 4
('Voyant la détresse dans les circuits de XB-3, Dylan décida de l''aider en le cachant dans un endroit sûr. Il savait qu''ils ne seraient pas en sécurité ici, exposés dans le hangar.'),
-- 5
('Alors qu''ils se dirigeaient vers le laboratoire pour cacher XB-3, Khon, l''alien traqueur de robots, surgit soudainement devant eux, le visage empreint de malice. Dylan sentit un frisson glacé lui parcourir l''échine en voyant cet être sinistre.'),
-- 6
('Dylan et XB-3 se glissèrent dans les profondeurs de l''école, échappant de justesse Khon et ses sbires. Ils se sentaient comme des fugitifs, cherchant désespérément un endroit sûr où se réfugier.'),
-- 7
('À la recherche d''une issue, Dylan trouva une porte dérobée menant sur un portail. Son cœur s''emballa d''espoir à l''idée de trouver une échappatoire, mais il se demanda si ce n''était pas un piège.'),
-- 8
('Le portail les conduisit à un jardin labyrinthique, un dédale végétal où le moindre faux pas pouvait être fatal. Dylan se creusa les méninges pour trouver un moyen de traverser en sécurité avec XB-3.'),
-- 9
('Alors qu''ils progressaient dans le labyrinthe, Dylan perçut des bruits de pas derrière eux. Son cœur battait la chamade alors qu''ils se dépêchaient de trouver la sortie, sachant que Khon n''était pas loin.'),
-- 10
('Se cacher était le bon choix, la végétation camouflant Dylan et XB-3 parvinrent enfin à sortir du labyrinthe après que Khon soit parti. Ils s''effondrèrent sur l''herbe fraîche, reprenant leur souffle, soulagés d''avoir échappé à leur poursuivant pour l''instant.'),
-- 11
('Alors qu''ils reprenaient leur souffle, Dylan réalisa qu''ils étaient perdus dans une forêt dense. Les arbres touffus semblaient se refermer sur eux, rendant leur fuite encore plus périlleuse.'),
-- 12
('Grimpant à un arbre pour avoir une meilleure vue, Dylan aperçut une lueur au loin, à travers le feuillage dense. Son esprit s''illumina d''espoir à l''idée de trouver une civilisation où ils pourraient se réfugier.'),
-- 13
('Se dirigeant vers la lumière, Dylan et XB-3 traversèrent la forêt dense jusqu''à arriver à un village reculé. Les maisons rustiques semblaient les accueillir chaleureusement, mais Dylan se demanda s''ils trouveraient refuge ici.'),
-- 14
('Le village les accueillit avec méfiance, les habitants jetant des regards suspicieux vers XB-3. Dylan sentit une pointe d''anxiété monter en lui, se demandant s''ils étaient réellement en sécurité ici.'),
-- 15
('Alors que la nuit tombait sur le village, Khon et ses sbires arrivèrent, semant la terreur parmi les habitants. Dylan et XB-3 se cachèrent dans les maisons du village, priant pour échapper à leur traqueur.'),
-- 16
('Alors que Khon semblait sur le point de partir, Dylan entendit un bruit de moteur au loin. Son cœur manqua un battement en réalisant que leur cachette pourrait être découverte à tout moment.'),
-- 17
('En enquêtant sur le bruit, Dylan découvrit un vaisseau spatial caché dans les bois, prêt à décoller. Une lueur d''espoir brilla dans ses yeux alors qu''il réalisait que c''était leur chance de fuir Khon.'),
-- 18
('Dylan et XB-3 montèrent à bord du vaisseau et commencèrent la procédure de décollage. Leurs doigts volaient sur les commandes, leurs cœurs battant la chamade à chaque seconde qui s''écoulait.'),
-- 19
('Malgré les tirs de Khon, le vaisseau de Dylan parvint à décoller, s''élevant dans le ciel étoilé. Leurs visages étaient illuminés par un mélange d''excitation et de soulagement alors qu''ils s''éloignaient de leur poursuivant.'),
-- 20
('En route vers le centre spatial, Dylan réalisa que le vaisseau était endommagé, mettant en péril leur sécurité. Son esprit bouillonnait d''inquiétude alors qu''il cherchait une solution pour réparer les dégâts.'),
-- 21
('Pendant que Dylan réparait le vaisseau, XB-3 détecta une transmission codée de Khon. Leurs cœurs se serrèrent en réalisant que leur ennemi n''avait pas abandonné sa chasse.'),
-- 22
('En décryptant la transmission, ils découvrirent que Khon prévoyait une embuscade au centre spatial. Une vague de détermination les envahit alors qu''ils se préparaient à affronter leur ennemi une fois de plus.'),
-- 23
('Après avoir averti le centre spatial, Dylan et XB-3 se retrouvèrent devant un choix crucial : fuir et éviter l''affrontement ou affronter Khon pour protéger les autres.'),
-- 24
('Alors qu''ils s''apprêtaient à affronter Khon, Dylan réalisa qu''ils auraient besoin d''aide pour vaincre leur redoutable adversaire. Son esprit s''activa alors qu''il réfléchissait à qui pourrait les aider dans leur combat.'),
-- 25
('Avec l''aide des autorités du centre spatial, Dylan et XB-3 élaborèrent un plan audacieux pour contrer l''embuscade de Khon. Leurs esprits étaient vifs alors qu''ils mettaient au point chaque détail de leur stratégie.'),
-- 26
('Alors qu''ils se dirigeaient vers l''embuscade, Dylan et XB-3 furent secourus par un groupe de résistants courageux, prêts à se battre à leurs côtés contre Khon et ses sbires.'),
-- 27
('Avec l''aide des résistants, Dylan et XB-3 lancèrent une attaque surprise contre Khon et ses sbires. Leurs cœurs battaient la chamade alors qu''ils se lançaient dans la bataille, déterminés à mettre fin à la menace de Khon une fois pour toutes.'),
-- 28
('Une lueur au bout du tunnel se dessinait et une opportunité de clore cette bataille prit jour. '),
-- 29
('Après un long combat acharné, Dylan et les résistants réussirent à capturer Khon, mettant ainsi un terme à sa tyrannie. Leurs visages étaient marqués par la fatigue, mais leurs cœurs étaient emplis de fierté pour leur victoire. Dylan et XB-3 entrèrent triomphalement au centre spatial, accueillis par des acclamations et des cris de joie. Leurs sacrifices n''avaient pas été vains, ils avaient sauvé leurs mondes d''une menace imminente.'),
-- 30
('Lors de la cérémonie de célébration, Dylan fut surpris de voir ses camarades de classe présents pour le soutenir, maintenant que Khon était neutralisé. Son cœur déborda de gratitude envers ceux qui l''avaient soutenu tout au long de cette épreuve.'),
-- 31
('Touché par le soutien sincère de ses camarades de classe, Dylan prit la parole pour exprimer sa gratitude. Ses mots résonnèrent dans la salle alors qu''il remerciait chacun pour leur soutien inébranlable dans les moments les plus sombres.'),

-- Fin avec partie fin jeu
-- 32
("Dylan ignore le bruit provenant du hangar et continue à étudier. Cependant, plus tard, il découvre que le bruit était causé par XB-3 qui avait besoin d'aide. Malheureusement, avant qu'il puisse agir, Khon retrouve XB-3 et capture Dylan, mettant fin à son aventure avant même qu'elle ne commence."),
-- 33
("En s'enfuyant de peur, Dylan laisse XB-3 qu'il n'a pas encore connu se faire capturer par un alien étrange"),
-- 34
("Dylan décide de s'approcher du hangar pour enquêter sur le bruit mais fait faux pas en retournant sur ses pas. Malheureusement, il se fait capturer par un alien étrange nommé Khon, alors qu'il tente de sauver XB-3. Ils sont tous les deux emmenés à bord du vaisseau de Khon, condamnés à une vie d'esclavage."),
-- 35
("Une panique générale s'ensuit quand les élèves découvrent que Dylan ramène un robot et un alien les traquant. Drôle de début de journée sur le campus."),
-- 36
("Affronter un alien n'est pas une bonne idée, surtout quand on est un simple étudiant. Dylan et XB-3 sont capturés par Khon et emmenés à bord de son vaisseau, mettant fin à leur aventure avant même qu'elle ne commence."),
-- 37
("Se cacher dans une école avec des aliens qui possèdent une technologie évoluée n'est jamais une bonne idée."),
-- 38
(" Un alien qui pose des pièges intelligement dans une école, n'est jamais signe de bon augure. La porte étant piégés, Dylan et XB-3 sont capturés par Khon et emmenés à bord de son vaisseau, mettant fin à leur aventure avant même qu'elle ne commence."),
-- 39
(" Courir n'était pas le choix le plus furtif même si c'était le plus rapide pour échapper à khon. Vous connaissez la suite (Dylan et XB-3 sont capturés par Khon et emmenés à bord de son vaisseau, mettant fin à leur aventure avant même qu'elle ne commence.)"),
-- 40
("Prendre un moment pour reprendre leur souffle n'était pas une bonne idée. Khon les retrouve et les capture."),
-- 41
("Point positif, ils ont échappé à Khon et ont de l'eau. Point négatif, ils se retrouvent VRAIMENT perdus dans une forêt inconnue et erre sans fin."),
-- 42
("Dylan et XB-3 décident de ne pas attirer l'attention et de rester cachés. Malheureusement, ils se retrouvent perdus et ne retrouvent pas le village en faisant marche arrière."),
-- 43
("Dylan et XB-3 décident de se faufiler discrétement dans le village. Malheureusement, les habitants du village les prennent pour des espions et les capturent."),
-- 44
("Dylan et XB-3 décident de se préparer à affronter Khon et ses sbires. Malheureusement, ils sont rapidement dépassés par le nombre et se font capturer."),
-- 45
("Dylan et XB-3 décident de tenter de contourner l'embuscade. Malheureusement, ils se retrouvent piégés dans un piège tendu par Khon et ses sbires."),
-- 46
("Ce n'est pas avec un navire frégate qu'un étudiant et un robot endommagé peuvent détruire une vaisselle de guerre alien."),

--47
("Après le crash de leur vaisseau sur une planète isolée, Dylan et XB-3 s'adaptent à leur nouvel environnement. Ils construisent un abri, cultivent leur nourriture et explorent les merveilles naturelles. Malgré les défis, ils trouvent la paix et le bonheur dans leur vie paisible sur cette planète inconnue, renforçant leur lien indéfectible."),
-- 48
("Si vous aviez pris le temps de décoder la transmission, vous auriez découvert que Khon prévoyait une embuscade au centre spatial. Malheureusement, vous avez ignoré la transmission et vous êtes tombé dans le piège de Khon, emmenant les innocents du centre spatial avec vous. Si seulement vous les aviez prévenus...."),
-- 49
("Un vaisseau n'est pas aussi simple qu'une voiture à manœuvrer. Vous avez tenté de contourner l'embuscade, mais vous avez fini par vous écraser sur une planète inconnue, mettant fin à votre aventure. Ca va coûter cher à l'assurance"),
-- 50
("On ne va pas toujours vous mâcher le travail, il faut agir à un moment donné!"),
-- 51
("Vous avez refusé l'aide des résistants et avez continué selon votre plan initial. Malheureusement, votre plan n'était pas suffisamment solide pour contrer Khon et ses sbires. Vous avez été capturé et emmené à bord du vaisseau de Khon, laissant derrière vous un sillon de cadavres."),
-- 52
("Toujours s'occuper des petits en premiers on s'occupe des gros ensuite, vous capturez khon mais seulement pendant 5minutes avant de vous faire submerger par le restant de son équipage."),
-- 53
("Vous avez offert une chance à Khon de se repentir et de changer. Malheureusement, il a profité de votre bonté pour vous éliminer et s'échapper"),
--54
("Vous méritez une médaille pour votre bravoure et votre dévouement. Vous avez sauvé des mondes entiers et méritez une vie paisible et heureuse. Vous rentrez chez vous, accueilli par des acclamations et des célébrations, honoré pour votre héroïsme. Puis vous vous installez dans votre lit, fatigué mais satisfait, prêt à vous reposer et à profiter de la paix retrouvée."),
--55
("Après avoir organisé une fête mémorable pour célébrer leur victoire, Dylan et XB-3 réunissent leurs amis et alliés pour partager des moments de joie et de camaraderie. Au milieu de la liesse, ils prennent le temps de discuter des leçons apprises au cours de leur aventure, évoquant avec émotion les défis surmontés et les sacrifices consentis. Ces discussions nourrissent leur esprit d'équipe et renforcent leurs liens, laissant des souvenirs indélébiles gravés dans leur esprit alors qu'ils envisagent avec optimisme l'avenir qui les attend.");
-- Réinsérer les données dans la table choix avec les clés étrangères correctes vers la table parties
INSERT INTO choix (partie_id, texte, image_url, prochain_partie_id, fin_jeu) VALUES
(1, 'Aller vérifier', 'neutral.svg', 2, 0),
(1, 'Ignorer et continuer à étudier', 'unknow.svg', 32, 1),
(2, 'Revenir en arrière discrètement', 'neutral.svg', 34, 1),
(2, 'S''approcher avec prudence', 'walle.svg', 3, 0),
(3, 'Offrir de l''aide', 'walle.svg', 4, 0),
(3, 'S''enfuir de peur', 'alien.svg', 33, 1),
(4, 'À la bibliothèque de l''école', 'neutral.svg', 35, 1),
(4, 'Dans un laboratoire de sciences abandonné', 'soul.svg', 5, 0),
(5, 'Affronter Khon', 'alien.svg', 36, 1),
(5, 'Chercher un autre chemin', 'unknow.svg', 6, 0),
(6, 'Continuer à se cacher', 'unknow.svg', 37, 1),
(6, 'Chercher un moyen de fuir l''école', 'neutral.svg', 7, 0),
(7, 'Ouvrir la porte', 'unknow.svg', 38, 1),
(7, 'Vérifier s''il y a des pièges', 'neutrala.svg', 8, 0),
(8, 'Traverser rapidement', 'neutrala.svg', 39, 1),
(8, 'Faire  le moins de bruit possible', 'neutrala.svg', 9, 0),
(9, 'Se cacher dans les buissons', 'neutral.svg', 10, 0),
(9, 'Courir pour semer leurs poursuivants', 'neutral.svg', 39, 1),
(10, 'Continuer à fuir', 'neutral.svg', 11, 0),
(10, 'Prendre un moment pour reprendre leur souffle', 'walle.svg', 40, 1),
(11, 'Suivre un cours d''eau', 'unknow.svg', 41, 1),
(11, 'Monter à un arbre pour avoir une meilleure vue', 'unknow.svg', 12, 0),
(12, 'Oui, pour chercher de l''aide', 'a.svg', 13, 0),
(12, 'Non, pour éviter d''attirer l''attention', 'unknow.svg', 42, 1),
(13, 'Discrètement, en évitant d''attirer l''attention', 'neutrala.svg', 43, 1),
(13, 'Ouvertement, en demandant de l''aide', 'soul.svg', 14, 0),
(14, 'Rassurer les habitants sur la nature inoffensive de XB-3', 'neutral.svg', 15, 0),
(14, 'Insister sur le fait que XB-3 est leur seul espoir contre Khon', 'alien.svg', 15, 0),
(15, 'Se cacher dans les maisons du village', 'neutrala.svg', 16, 0),
(15, 'Se préparer à affronter Khon et ses sbires', 'neutrala.svg', 44, 1),
(16, 'Attendre que Khon parte', 'neutral.svg', 45, 1),
(16, 'Tenter d''investiger le bruit pendant que Khon est occupé', 'unknow.svg', 17, 0),
(17, 'Courir brutalement jusqu''au vaisseau', 'a.svg', 18, 0),
(17, 'Se faufiler discrétement', 'unknow.svg', 18, 0),
(18, 'Appuyer sur le premier bouton à vue', 'unknow.svg', 19, 0),
(18, 'Appuyer sur tout les boutons', 'unknow.svg', 19, 0),
(19, 'Accélérer le décollage et fuir', 'neutrala.svg', 20, 0),
(19, 'Tenter de détruire le vaisseau de Khon avant de décoller', 'neutrala.svg', 46, 1),
(20, 'Vers le centre spatial le plus proche pour demander de l''aide', 'soul.svg', 21, 0),
(20, 'Vers un endroit reculé de l''univers pour se cacher de Khon', 'unknow.svg', 47, 1),
(21, 'Tenter de réparer le vaisseau eux-mêmes', 'unknow.svg', 22, 0),
(21, 'Continuer malgré les dommages et espérer atteindre leur destination', 'neutral.svg', 22, 0),
(22, 'Tenter de décoder la transmission pour anticiper les plans de Khon', 'unknow.svg', 23, 0),
(22, 'Ignorer la transmission et se concentrer sur la réparation du vaisseau', 'neutral.svg', 48, 1),
(23, 'Prévenir le centre spatial du danger imminent', 'soul.svg', 24, 0),
(23, 'Tenter de trouver un moyen de contourner l''embuscade', 'neutral.svg', 49, 1),
(24, 'Se préparer à affronter Khon directement', 'alien.svg', 25, 0),
(24, 'Chercher une autre issue pour échapper à Khon', 'walle.svg', 25, 0),
(25, 'Demander l''aide des autorités du centre spatial', 'walle.svg', 26, 0),
(25, 'Activer un signal de détresse pour appeler des renforts', 'soul.svg', 26, 0),
(26, 'Attendre l''arrivée des renforts au centre spatial', 'soul.svg', 50, 1),
(26, 'Se rendre sur le lieu de l''embuscade pour prendre Khon par surprise', 'neutral.svg', 27, 0),
(27, 'Accepter l''aide des résistants et élaborer un plan ensemble', 'neutral.svg', 28, 0),
(27, 'Refuser l''aide des résistants et continuer selon leur plan initial', 'unknow.svg', 51, 1),
(28, 'Profiter de la confusion pour capturer Khon', 'alien.svg', 52, 1),
(28, 'Se battre jusqu''à ce que tous les sbires de Khon soient neutralisés', 'alien.svg', 29, 0),
(29, 'Le livrer aux autorités du centre spatial', 'soul.svg', 30, 0),
(29, 'Lui offrir une chance de se repentir et de changer', 'alien.svg', 53, 1),
(30, 'Recevoir les éloges et les remerciements des autorités spatiales', 'soul.svg', 31, 0),
(30, 'Rejoindre ses camarades', 'soul.svg', 31, 0),
(31, 'Participer à une cérémonie de récompense en leur honneur', 'walle.svg', 32, 0),
(31, 'Retourner à leur vie quotidienne avec un sentiment de satisfaction accomplie', 'neutrala.svg', 54, 0),
(32, 'Organiser une fête pour célébrer leur victoire', 'neutrala.svg', 55, 1),
(32, 'Discuter des leçons apprises et des souvenirs de leur aventure', 'neutrala.svg', 56, 1);




