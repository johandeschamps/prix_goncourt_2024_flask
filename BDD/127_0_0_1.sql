-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Hôte : 127.0.0.1:3306
-- Généré le : lun. 02 déc. 2024 à 13:37
-- Version du serveur : 8.3.0
-- Version de PHP : 8.2.18

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `prix_goncourt_2024`
--
CREATE DATABASE IF NOT EXISTS `prix_goncourt_2024` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci;
USE `prix_goncourt_2024`;

-- --------------------------------------------------------

--
-- Structure de la table `author`
--

DROP TABLE IF EXISTS `author`;
CREATE TABLE IF NOT EXISTS `author` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `biography` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `author`
--

INSERT INTO `author` (`id`, `name`, `biography`) VALUES
(1, 'Ruben Barrouk', 'Ruben Barrouk est né en 1997 à Paris. En 2022, il retourne sur les traces de sa famille séfarade à Marrakech, où vit sa grand-mère, personnage principal de ce premier roman.'),
(2, 'Thomas Clerc', 'Thomas Clerc vit rue Erlanger (16e arrondissement de Paris) entre 1965 et 1980.Il est agrégé de lettres modernes, docteur en lettres et maître de conférences en littérature contemporaine à luniversité Paris-Nanterre2.Thomas Clerc développe une écriture introspective, notamment dans son roman Intérieur dont le décor unique est son propre appartement à Paris3.Il est mis en cause sur les réseaux sociaux en décembre 2015, à propos dun texte4 considéré par certains internautes comme méprisant envers les consommateurs de Starbucks, jugés moins intelligents que la moyenne. Le billet, intitulé « Attentats : que Starbucks paie laddition », fait un rapprochement entre lentreprise américaine et la lutte contre le terrorisme, un mois après les attentats du 13 novembre 2015 en France5.'),
(3, 'Sandrine Collette', 'Sandrine Collette vit dans le Morvan. Elle est notamment lauteure de Et toujours les Forêts, Grand prix RTL Lire, prix du Livre France Bleu - PAGE des libraires, prix de La Closerie des Lilas, ainsi que de On était des loups, prix Renaudot des Lycéens et prix Giono 2022.'),
(4, 'Kamel Daoud', 'Kamel Daoud, né le 17 juin 1970 à Mesra1 (wilaya de Mostaganem2), en Algérie, est un écrivain et journaliste algérien dexpression française, lauréat du prix Goncourt du premier roman en 2015. Il est naturalisé français en 20203.\r\nEntré en 1994 au Quotidien dOran, il y a ensuite été rédacteur en chef pendant huit ans. Il initie en 2014 une collaboration avec lhebdomadaire Le Point consacrée par la remise du prix Jean-Luc Lagardère du journaliste de lannée 2016.'),
(5, 'Gaël Faye', 'Gaël Faye est un auteur-compositeur-interprète, rappeur et écrivain franco-rwandais, né le 6 août 1982 à Bujumbura au Burundi.'),
(6, 'Hélène Gaudy', 'Hélène Gaudy, née en 1979 à Paris, est une écrivaine française.'),
(7, 'Philippe JAENADA', 'ilippe Jaenada, né le 25 mai 1964 à Saint-Germain-en-Laye, est un écrivain français.'),
(8, 'Maylis de Kerangal', 'Maylis Le Gal de Kerangal dite Maylis de Kerangal est une écrivaine française, née le 16 juin 19671 à Toulon.'),
(9, 'Étienne KERN', 'Étienne Kern, né le 29 novembre 1983 à Saverne, est un écrivain français.'),
(10, 'Emmanuelle LAMBERT', 'Emmanuelle Lambert, née le 7 juin 1975, est une écrivaine française.'),
(11, 'Rebecca Lighieri', 'Emmanuelle Bayamack-Tam, née Garino le 16 mars 1966 à Marseille, est une écrivaine française1. Elle écrit également sous le pseudonyme de Rebecca Lighieri.'),
(12, 'Carole MARTINEZ', 'Carole Martinez, née le 10 novembre 1966 à Créhange, est une romancière française.'),
(13, 'Thibault de MONTAIGU', 'Thibault de Montaigu, né le 21 décembre 1978 à Boulogne-Billancourt, est un écrivain et journaliste français.'),
(14, 'Olivier NOREK', 'Olivier Norek, né en 1975 à Toulouse et originaire de Castelnau-Pégayrols dans lAveyron, est un écrivain et scénariste français, ancien capitaine de police judiciaire en Seine-Saint-Denis.Ses romans sont principalement des polars. Il est notamment lauteur de la trilogie « Victor Coste ». Ses romans abordent des thèmes politiques et sociaux engagés (sort des migrants à Calais, écoterrorisme, etc.).'),
(15, 'Jean-Noël ORENGO', 'Jean-Noël Orengo, né en 1975, est un écrivain français.'),
(16, 'Abdellah TAÏA', 'Abdellah Taïa (en arabe : عبد الله الطايع), né le 8 août 1973 à Salé au Maroc1, est un écrivain et cinéaste marocain dexpression française.');

-- --------------------------------------------------------

--
-- Structure de la table `book`
--

DROP TABLE IF EXISTS `book`;
CREATE TABLE IF NOT EXISTS `book` (
  `id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `summary` text,
  `publication_date` date DEFAULT NULL,
  `pages` int DEFAULT NULL,
  `ISBN` varchar(13) DEFAULT NULL,
  `publisher_price` decimal(10,2) DEFAULT NULL,
  `author_id` int DEFAULT NULL,
  `publisher_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `author_id` (`author_id`),
  KEY `publisher_id` (`publisher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `book`
--

INSERT INTO `book` (`id`, `title`, `summary`, `publication_date`, `pages`, `ISBN`, `publisher_price`, `author_id`, `publisher_id`) VALUES
(1, 'Tout le bruit du Guéliz', 'Dans le quartier du Guéliz à Marrakech, un mystérieux bruit hante et tourmente, nuit et jour, une vieille dame. Inquiets, sa fille et son petit-fils quittent Paris pour mener lenquête. Sur place, ils guettent, épient, espèrent, mais aucun bruit ne se fait entendre...\r\nTout le bruit du Guéliz ne nous livre pas une mais mille histoires : celles des exodes, des traditions, des liens qui se font et se défont, des origines perdues.\r\nÀ la violence et au vacarme assourdissant de notre époque, ce premier roman aux allures de conte, à la fois tendre, drôle et bouleversant, oppose un bruit. Le bruit du Guéliz. Celui dun temps révolu, où lon vivait ensemble.', '2024-08-21', 213, '9782226496058', 19.90, 1, 1),
(2, 'Paris, musée du XXIe siècle', 'Le 18e arrondissement compte 425 rues, squares, places, avenues, cités, jardins, villas, boulevards, impasses et passages que Thomas Clerc a entrepris d’arpenter depuis qu’il y a emménagé récemment. Description totale, née de ses déambulations, dérives et notations, ce livre n’omet rien de ce que la ville laisse voir, entendre et ressentir. De Montmartre aux abords du périphérique, des habitants de ses quartiers aux touristes égarés, des cafés aux darks stores, de la nuit au jour, l’ancien faubourg de Paris, insurgé sous la Commune, ne cesse de changer d’apparence, quand ce n’est l’auteur lui-même qui le refaçonne au gré de son périple. Le 18e se déroule comme une toile géante où chaque rue est un tableau vivant.', '2024-08-29', 624, '\r\n2707355364', 25.00, 2, 2),
(3, 'Madelaine avant laube', 'C’est un endroit à l’abri du temps. Ce minuscule hameau, qu’on appelle Les Montées, est un pays à lui seul pour les jumelles Ambre et Aelis, et la vieille Rose.\r\nIci, l’existence n’a jamais été douce. Les familles travaillent une terre avare qui appartient à d’autres, endurent en serrant les dents l’injustice. Mais c’est ainsi depuis toujours.\r\nJusqu’au jour où surgit Madelaine. Une fillette affamée et sauvage, sortie des forêts. Adoptée par Les Montées, Madelaine les ravit, passionnée, courageuse, si vivante. Pourtant, il reste dans ses yeux cette petite flamme pas tout à fait droite. Une petite flamme qui fera un jour brûler le monde.', '2024-08-24', 300, '	\r\n9782709674', 20.90, 3, 3),
(4, 'Houris', ' Je suis la véritable trace, le plus solide des indices attestant de tout ce que nous avons vécu en dix ans en Algérie. Je cache lhistoire dune guerre entière, inscrite sur ma peau depuis que je suis enfant. »\r\nAube est une jeune Algérienne qui doit se souvenir de la guerre dindépendance, quelle na pas vécue, et oublier la guerre civile des années quatre vingt dix, quelle a elle-même traversée. Sa tragédie est marquée sur son corps : une cicatrice au cou et des cordes vocales détruites. Muette, elle rêve de retrouver sa voix.\r\nSon histoire, elle ne peut la raconter quà la fille quelle porte dans son ventre. Mais a-t-elle le droit de garder cette enfant Peut-on donner la vie quand on vous la presque arrachée ? Dans un pays qui a voté des lois pour punir quiconque évoque la guerre civile, Aube décide de se rendre dans son village natal, où tout a débuté, et où les morts lui répondront peut-être.', '2024-08-15', 411, '9782072999994', 23.00, 4, 4),
(5, 'Jacaranda', 'Quels secrets cache l’ombre du jacaranda, l’arbre fétiche de Stella  ? Il faudra à son ami Milan des années pour le découvrir. Des années pour percer les silences du Rwanda, dévasté après le génocide des Tutsi. En rendant leur parole aux disparus, les jeunes gens échapperont à la solitude. Et trouveront la paix près des rivages magnifiques du lac Kivu.\r\nSur quatre générations, avec sa douceur unique, Gaël Faye nous raconte l’histoire terrible d’un pays qui s’essaie malgré tout au dialogue et au pardon. Comme un arbre se dresse entre ténèbres et lumière, Jacaranda célèbre l’humanité, paradoxale, aimante, vivante.', '2024-08-14', 281, '	\r\n9782246831', 20.90, 5, 5),
(6, 'Archipels', 'Aux confins de la Louisiane, une île porte le prénom de mon père.\r\n\r\nChaque jour, elle s’enfonce un peu plus sous les eaux.?»\r\n\r\nIl a fallu que son esprit vogue jusqu’à l’Isle de Jean-Charles pour qu’elle se retrouve enfin face à son père. Qui est cet homme à la présence tranquille, à la parole rare, qui se dit sans mémoire?? Pour le découvrir elle se lance dans un projet singulier : lui rendre ses souvenirs, les faire resurgir des objets et des paysages.\r\nLe premier lieu à arpenter est l’atelier où il a amassé toutes sortes de curiosités, autant de traces qui nourrissent l’enquête sur ce mystère de proximité : le temps qui passe et ces grands inconnus que demeurent souvent nos parents. Derrière l’accumulateur compulsif, l’archiviste des vies des autres, se révèlent l’homme enfant marqué par la guerre, l’artiste engagé et secret. Peu à peu leur relation change, leurs écritures se mêlent et ravivent les hantises et les rêves de toute une époque.\r\nÀ travers cette géographie intime, Hélène Gaudy explore ce qui se transmet en silence, offrant à son père l’espoir d’un lieu insubmersible – et aux lecteurs, un texte sensible d’une grande beauté.', '2024-01-01', 285, '9782823621150', 21.00, 6, 6),
(7, 'La désinvolture est une bien belle chose', 'Pourquoi, un matin dautomne, une si jolie jeune femme, intelligente et libre, entourée damis, admirée, une fille que la vie semblait amuser, amoureuse dun beau soldat américain qui laimait aussi, sest-elle jetée à laube par la fenêtre dune chambre dhôtel, à vingt ans ? Jaimerais savoir, comprendre.', '2024-01-01', 486, '9782080427298', 22.00, 7, 7),
(8, 'Jour de ressac', 'Finalement, il vous dit quelque chose, notre homme ? Nous arrivions à hauteur de Gonfreville-lOrcher, la raffinerie sortait de terre, indéchiffrable et nébuleuse, façon Gotham City, une autre ville derrière la ville, jai baissé ma vitre et inhalé longuement, le nez orienté vers les tours de distillation, vers ce Meccano démentiel. Létrange puanteur sengouffrait dans la voiture, mélange dhydrocarbures, de sel et de poudre. Il ma intimé de refermer avant de minterroger de nouveau, pourquoi avais-je finalement demandé à voir le corps ? Cest que vous y avez repensé, cest que quelque chose a dû vous revenir.\r\n\r\nOui, jy avais repensé. Quest-ce quil simaginait. Je navais pratiquement fait que penser à ça depuis ce matin, mais y penser avait fini par prendre la forme dune ville, dun premier amour, la forme dun porte-conteneurs.', '2024-08-15', 241, '	\r\n9782073054', 21.00, 8, 8),
(9, 'La vie meilleure', 'Nous sommes la somme de nos amours. Et cest la seule chose qui restera de nous. »\r\nOn la comparé à Gandhi, à Einstein, à Lénine. Des foules lont acclamé. Des milliardaires lui ont tapé sur lépaule. Les damnés de la terre lont imploré. Aujourdhui, son nom nous fait sourire, tout comme son invention : la méthode Coué.\r\nSingulier destin que celui dÉmile Coué, obscur pharmacien français devenu célébrité mondiale, tour à tour adulé et moqué. La vie meilleure retrace lhistoire de ce précurseur du développement personnel qui, au début du XXe siècle, pensait avoir découvert les clés de la santé et du bonheur. Un homme sincère jusque dans sa roublardise, qui croyait plus que tout au pouvoir des mots et de limagination.\r\nAvec ce roman lumineux aux accents intimes, Étienne Kern rend hommage à ceux qui cherchent coûte que coûte une place pour la joie.', '2024-08-22', 187, '9782073075833', 19.50, 9, 4),
(10, 'Aucun respect', 'Une jeune femme idéaliste comme on peut lêtre à vingt ans arrive à Paris à la fin des années 1990. On la suit dans sa découverte dun milieu intellectuel qui a tout dune caste dhommes.\r\nElle y rencontre lécrivain Alain Robbe-Grillet, imposant « Pape du Nouveau Roman », et son épouse Catherine, maîtresse-star de cérémonies sadomasochistes. Ils incarnent une certaine idée de la littérature et de la liberté sexuelle. Toutes choses auxquelles lhéroïne saffronte tant bien que mal.\r\nRaconté avec impertinence depuis aujourdhui, son apprentissage, dune drôlerie irrésistible, est un conte contemporain. Sa leçon est que la liberté sexerce dans le jeu avec les autorités établies. Et sa morale, quil ne faut jamais sous-estimer les jeunes femmes.', '2024-08-21', 224, '	\r\n9782234093', 20.00, 10, 9),
(11, '\r\nLe club des enfants perdus', 'À vingt-sept ans, Miranda semble appartenir à un drôle de club : celui des enfants qui nont manqué de rien sauf de cette joie pure, essentielle, que certains ressentent du seul fait dêtre en vie.', '2024-08-22', 515, '9782818061435', 22.00, 11, 10),
(12, 'Dors ton sommeil de brute', 'Un long hurlement, celui d’une foule d’enfants, secoue la planète. Dans les villes, le Cri passe à travers les murs, se faufile dans les canalisations, jaillit sous les planchers, court dans les couloirs des tours où les familles dorment les unes au-dessus des autres, le Cri se répand dans les rues. »\r\nUn rêve collectif court à la vitesse de la rotation terrestre. Il touche tous les enfants du monde à mesure que la nuit avance.\r\nLes nuits de la planète seront désormais marquées par l’apparition de désordres nouveaux, comme si les esprits de la nature tentaient de communiquer avec l’humanité à travers les songes des enfants.\r\nEva a fui son mari et s’est coupée du monde. Dans l’espace sauvage où elle s’est réfugiée avec sa fille Lucie, elle est déterminée à se battre contre ce qui menace son enfant durant son sommeil sur une Terre qui semble basculer.\r\nComment lutter contre la nuit et les cauchemars d’une fillette ?', '2024-08-15', 400, '9782072929861', 22.00, 12, 4),
(13, 'Coeur', 'Je croyais écrire cette histoire pour mon père, alors que cétait linverse : cette histoire, il me lavait offerte. Et chaque fois que jouvrirai ces pages, je le retrouverai comme si je tenais son coeur vivant entre mes mains. »\r\nQuand son père malade le presse décrire sur son ancêtre Louis, capitaine des hussards fauché en 1914 dans une charge de cavalerie, Thibault de Montaigu ne sait pas encore quel secret de famille cache cette mort héroïque. Ni pourquoi elle résonne étrangement avec le destin de son propre père qui décline de jour en jour. La course contre la montre quil engage alors pour remonter le passé se mue en une enquête bouleversante où se succèdent personnages proustiens et veuves de guerre, amants flamboyants et épouses délaissées.\r\nThibault de Montaigu nous raconte une lignée hantée par la gloire et lhonneur. Mais aussi ce quil reste damour et de courage dissimulés dans le coeur des hommes.', '2024-08-21', 327, '9782226493217', 21.90, 13, 1),
(14, 'Les guerriers de lhiver', 'Je suis certain que nous avons réveillé leur satané Sisu.\r\n– Je ne parle pas leur langue, camarade.\r\n– Et je ne pourrais te traduire ce mot, car il na déquivalent nulle part ailleurs. Le Sisu est lâme de la Finlande. Il dit le courage, la force intérieure, la ténacité, la résistance, la détermination... Une vie austère, dans un environnement hostile, a forgé leur mental dun acier qui nous résiste aujourdhui. \"\r\nImaginez un pays minuscule.\r\nImaginez-en un autre, gigantesque.\r\nImaginez maintenant quils saffrontent.\r\nAu cœur du plus mordant de ses hivers, au cœur de la guerre la plus meurtrière de son histoire, un peuple se dresse contre lennemi, et parmi ses soldats naît une légende. La légende de Simo, la Mort Blanche.', '2024-08-29', 446, '9782749947204', 21.95, 14, 11),
(15, 'Vous êtes lamour malheureux du Führer', '1969 : Albert Speer, architecte favori et ministre de lArmement dHitler, publie ses Mémoires. Revisitant son passé, de ses mises en scène des congrès nazis à la chute du Reich, il parachève lultime métamorphose qui a sauvé sa tête au procès de Nuremberg et va faire de lui la star de la culpabilité allemande. Affirmant navoir rien su de la Solution finale, il se déclare « responsable, mais pas coupable ». Les historiens auront beau démontrer quil a menti, sa version de lui-même simposera toujours.\r\nComment écrire sur un homme qui a rendu la fiction plus séduisante que la vérité ?\r\nÀ lheure des fake news et de la guerre des récits, voici le roman dun des plus grands mensonges de lHistoire. Traquant les scènes de la vie de Speer, sinterrogeant sur leur vraisemblance, éclairant certains aspects, allant là où il sarrête en convoquant les acteurs capitaux daprès-guerre, notamment lhistorienne Gitta Sereny, lauteur propose une lecture vertigineuse de celui à qui lun de ses collaborateurs affirmait : « Savez-vous ce que vous êtes ? Vous êtes lamour malheureux du Führer.', '2024-08-28', 263, '9782246831372', 20.90, 15, 5),
(16, 'Le bastion des larmes', 'À la mort de sa mère, Youssef, un professeur marocain exilé en France depuis un quart de siècle, revient à Salé, sa ville natale, à la demande de ses sœurs, pour liquider lhéritage familial. En lui, cest tout un passé qui ressurgit, où se mêlent inextricablement souffrances et bonheur de vivre.\r\nÀ travers lui, les voix du passé résonnent et linterpellent, dont celle de Najib, son ami et amant de jeunesse au destin tragique, happé par le trafic de drogue et la corruption dun colonel de larmée du roi Hassan II. À mesure que Youssef senfonce dans les ruelles de la ville actuelle, un monde perdu reprend forme, guetté par la misère et la violence, où la différence, sexuelle, sociale, se paie au prix fort. Frontière ultime de ce roman splendide, le Bastion des Larmes, nom donné aux remparts de la vieille ville, à lombre desquels Youssef a jadis fait une promesse à Najib. \" Notre passé... notre grande fiction \", médite Youssef, tandis quil sapprête à entrer pleinement dans son héritage, celui dune enfance terrible, dun amour absolu, aussi, pour ses sœurs magnifiques et sa mère disparue.', '2024-08-22', 212, '9782260056515', 21.00, 16, 12);

-- --------------------------------------------------------

--
-- Structure de la table `jury`
--

DROP TABLE IF EXISTS `jury`;
CREATE TABLE IF NOT EXISTS `jury` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `role` enum('member','president') NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `jury`
--

INSERT INTO `jury` (`id`, `name`, `role`) VALUES
(1, 'Didier Decoin', 'president'),
(2, 'Françoise Chandernagor', 'member'),
(3, 'Tahar Ben Jelloun', 'member'),
(4, 'Christine Angot', 'member'),
(5, 'Pierre Assouline', 'member'),
(6, 'Philippe Claudel', 'member'),
(7, 'Paule Constant', 'member'),
(8, 'Éric-Emmanuel Schmitt', 'member'),
(9, 'Camille Laurens', 'member'),
(10, 'Pascal Bruckner', 'member');

-- --------------------------------------------------------

--
-- Structure de la table `maincharacter`
--

DROP TABLE IF EXISTS `maincharacter`;
CREATE TABLE IF NOT EXISTS `maincharacter` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `book_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `maincharacter`
--

INSERT INTO `maincharacter` (`id`, `name`, `book_id`) VALUES
(1, 'la vieille dame,sa fillet et son petit fils', 1),
(2, 'Thomas CLERC', 2);

-- --------------------------------------------------------

--
-- Structure de la table `publisher`
--

DROP TABLE IF EXISTS `publisher`;
CREATE TABLE IF NOT EXISTS `publisher` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `publisher`
--

INSERT INTO `publisher` (`id`, `name`, `address`) VALUES
(1, 'Albin Michel', '22 rue Huyghens, 75014 Paris'),
(2, 'Les éditions de Minuit', '7, rue Bernard-Palissy, 75006 Paris'),
(3, 'JC Lattès', '17 r Jacob, 75006 Paris'),
(4, 'Gallimard', '5 r Gaston Gallimard, 75007 Paris'),
(5, 'Grasset', '61 r Saints Pères, 75006 Paris'),
(6, 'LOlivier', '72 av République, 75011 Paris'),
(7, 'Mialet-Barrault', '3 place de l’Odéon 75006 Paris'),
(8, 'Verticales', '26 rue de Condé 75006 Paris'),
(9, 'Stock', '...'),
(10, 'P.O.L', '33, rue Saint-André-des-Arts\r\n75006 Paris'),
(11, 'Michel Lafon', '118 av Achille Peretti, 92200 Neuilly sur Seine'),
(12, 'Julliard', '22 rue du Pont Neuf 75001 Paris');

-- --------------------------------------------------------

--
-- Structure de la table `selection`
--

DROP TABLE IF EXISTS `selection`;
CREATE TABLE IF NOT EXISTS `selection` (
  `id` int NOT NULL,
  `date` date DEFAULT NULL,
  `type` enum('First','Second','Third') NOT NULL,
  PRIMARY KEY (`id`,`type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `selection`
--

INSERT INTO `selection` (`id`, `date`, `type`) VALUES
(1, '2024-09-03', 'First'),
(1, '2024-10-01', 'Second'),
(2, '2024-09-03', 'First'),
(3, '2024-09-03', 'First'),
(4, '2024-09-03', 'First'),
(4, '2024-10-01', 'Second'),
(5, '2024-09-03', 'First'),
(6, '2024-09-03', 'First'),
(7, '2024-09-03', 'First'),
(8, '2024-09-03', 'First'),
(9, '2024-09-03', 'First'),
(10, '2024-09-03', 'First'),
(11, '2024-09-03', 'First'),
(11, '2024-10-01', 'Second'),
(12, '2024-09-03', 'First'),
(13, '2024-09-03', 'First'),
(14, '2024-09-03', 'First'),
(15, '2024-09-03', 'First'),
(16, '2024-09-03', 'First');

-- --------------------------------------------------------

--
-- Structure de la table `vote`
--

DROP TABLE IF EXISTS `vote`;
CREATE TABLE IF NOT EXISTS `vote` (
  `id` int NOT NULL AUTO_INCREMENT,
  `book_id` int DEFAULT NULL,
  `jury_member_id` int DEFAULT NULL,
  `votes` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `book_id` (`book_id`),
  KEY `jury_member_id` (`jury_member_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;

--
-- Déchargement des données de la table `vote`
--

INSERT INTO `vote` (`id`, `book_id`, `jury_member_id`, `votes`) VALUES
(1, 2, 7, 1);

--
-- Contraintes pour les tables déchargées
--

--
-- Contraintes pour la table `author`
--
ALTER TABLE `author`
  ADD CONSTRAINT `author_ibfk_1` FOREIGN KEY (`id`) REFERENCES `book` (`author_id`);

--
-- Contraintes pour la table `book`
--
ALTER TABLE `book`
  ADD CONSTRAINT `book_ibfk_1` FOREIGN KEY (`publisher_id`) REFERENCES `publisher` (`id`),
  ADD CONSTRAINT `fk_author` FOREIGN KEY (`author_id`) REFERENCES `author` (`id`);

--
-- Contraintes pour la table `vote`
--
ALTER TABLE `vote`
  ADD CONSTRAINT `vote_ibfk_1` FOREIGN KEY (`book_id`) REFERENCES `book` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
