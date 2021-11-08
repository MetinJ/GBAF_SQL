-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : lun. 08 nov. 2021 à 12:54
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `gbaf_sql`
--

-- --------------------------------------------------------

--
-- Structure de la table `accounts`
--

CREATE TABLE `accounts` (
  `id` int(11) NOT NULL,
  `last_name` varchar(255) NOT NULL,
  `first_name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `secret_question` varchar(255) NOT NULL,
  `answer` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `accounts`
--

INSERT INTO `accounts` (`id`, `last_name`, `first_name`, `username`, `password`, `secret_question`, `answer`) VALUES
(1, 'Moi', 'Moii', 'Al', '$2y$10$.TbNB957ELcacTEro1bsiuBXTiNgaJg.1kfXmP5FBthwEQNsbvuS.', 'Quelle est votre couleur préférée?', 'noir'),
(2, 'Estelle', 'Sarlija', 'Estou', '$2y$10$zBCPBnt5PQEQY5qHUYrQJOD6sa0nsudsr93D.ZE2Yp8.pCIlzTi1O', 'Quelle est votre couleur préférée?', 'bleue'),
(3, 'Castille', 'Benoït', 'Bebeuh', '$2y$10$dk4aEyIxf/Vu/UepPc0dt.zHGf.OnAWpkEI5MG3f9ZCC/lyS2WbXa', 'Quelle est votre couleur préférée?', 'rouge'),
(4, 'Poliakov', 'Jack', 'Daniel', '$2y$10$75BUX3DLTqSMp0VolfGh6eT3bD.yXZjvDPKp6sDIt4PzV8d.AYyaa', 'Quelle est votre couleur préférée?', 'dorée');

-- --------------------------------------------------------

--
-- Structure de la table `acteurs`
--

CREATE TABLE `acteurs` (
  `id` int(11) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `like_count` int(11) NOT NULL DEFAULT '0',
  `dislike_count` int(11) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `acteurs`
--

INSERT INTO `acteurs` (`id`, `logo`, `name`, `description`, `like_count`, `dislike_count`) VALUES
(1, 'formation_co.png', 'Formation&co', 'Formation&co est une association française présente sur tout le territoire.\r\nNous proposons à des personnes issues de tout milieu de devenir entrepreneur grâce à un crédit et un accompagnement professionnel et personnalisé.\r\nNotre proposition : \r\n⦁	un financement jusqu’à 30 000€ ;\r\n⦁	un suivi personnalisé et gratuit ;\r\n⦁	une lutte acharnée contre les freins sociétaux et les stéréotypes.\r\n\r\nLe financement est possible, peu importe le métier : coiffeur, banquier, éleveur de chèvres… . Nous collaborons avec des personnes talentueuses et motivées.\r\nVous n’avez pas de diplômes ? Ce n’est pas un problème pour nous ! Nos financements s’adressent à tous.\r\n', 8974234, 123412),
(2, 'protectpeople.png', 'Protectpeople', 'Protectpeople finance la solidarité nationale.\r\nNous appliquons le principe édifié par la Sécurité sociale française en 1945 : permettre à chacun de bénéficier d’une protection sociale.\r\n\r\nChez Protectpeople, chacun cotise selon ses moyens et reçoit selon ses besoins.\r\nProectecpeople est ouvert à tous, sans considération d’âge ou d’état de santé.\r\nNous garantissons un accès aux soins et une retraite.\r\nChaque année, nous collectons et répartissons 300 milliards d’euros.\r\nNotre mission est double :\r\n⦁	sociale : nous garantissons la fiabilité des données sociales ;\r\n⦁	économique : nous apportons une contribution aux activités économiques.\r\n', 874213, 45365),
(3, 'Dsa_france.png', 'DSA France', 'Dsa France accélère la croissance du \r\nterritoire et s’engage avec les collectivités territoriales.\r\nNous accompagnons les entreprises dans les étapes clés de leur évolution.\r\nNotre philosophie : s’adapter à chaque entreprise.\r\nNous les accompagnons pour voir plus grand et plus loin et proposons des \r\nsolutions de financement adaptées à chaque étape de la vie des \r\nentreprises', 1185398, 36222),
(4, 'CDE.png', 'CDE', 'La CDE (Chambre Des Entrepreneurs) accompagne les entreprises dans leurs démarches de formation. \r\nSon président est élu pour 3 ans par ses pairs, chefs d’entreprises et présidents des CDE.', 259567, 86614);

-- --------------------------------------------------------

--
-- Structure de la table `posts`
--

CREATE TABLE `posts` (
  `id` int(11) NOT NULL,
  `bank_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `date_created` datetime NOT NULL,
  `comment` varchar(265) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `posts`
--

INSERT INTO `posts` (`id`, `bank_id`, `user_id`, `date_created`, `comment`) VALUES
(1, 1, 1, '2021-11-03 14:21:58', 'Très satisfait de cette association qui a été capable de m\'aider comme il faut, je la recommande à d\'autres qui sont en recherche de financement pour devenir auto-entrepreneur '),
(2, 1, 2, '2021-11-03 15:21:52', 'Pour moi cela fait quelques mois que je\r\nsuis ici et j\'usqu\'a maintenant je n\'ai jamais rien eu à signaler, Je \r\nsuis satisfaite du service rendue après tout au long de la mise en place\r\ndu projet'),
(3, 1, 3, '2021-11-03 15:25:22', 'Moi qui voulait devenir entrepreneur c\'est chose faite ! grâce à Formation&Co j\'ai été servi et j\'en suis satisfait'),
(4, 1, 4, '2021-11-03 15:30:30', 'Cette agence à répondu à mes attentes, que dire de plus à part que je sois satisfait ? rien d\'autre, continuez comme ça, vous faites un merveilleux travail !'),
(5, 2, 4, '2021-11-03 15:33:16', 'Ensemble des services corrects, rien à redire '),
(6, 3, 4, '2021-11-03 15:34:25', 'Je ne connais pas cet organisme concernant les aides, je vais donc me renseigner pour me faire un avis, pour le moment mon commentaire sera neutre'),
(7, 4, 4, '2021-11-03 15:35:25', 'J\'ai bien peur que le CDE n\'existe pas car je n\'en ai pas entendu parlé et il y a trop peu de détails pour que l\'avis du client soit correct. Alors faites un effort s\'il vous plait'),
(8, 2, 2, '2021-11-03 15:37:41', 'Très bon organisme continuez comme ça, j\'en parlerais à des connaissances, peut être qu\'elles passeront par chez vous !'),
(9, 3, 2, '2021-11-03 15:38:57', 'Le programme a l\'ai pas mal pour ceux qui passent par votre organisme '),
(10, 4, 2, '2021-11-03 15:42:26', 'Aucunement satisfaite de vos services, je ne VOUS RECOMMANDE A PERSONNE'),
(11, 2, 1, '2021-11-03 15:43:46', 'Vos services dans l\'ensemble ont l\'air bien, mais j\'ai déjà mon agence ! certes un bon boulot de votre part !'),
(12, 3, 1, '2021-11-03 15:44:42', 'Votre agence vient d\'ouvrir et vous êtes déjà prometteurs ! '),
(13, 4, 3, '2021-11-03 15:45:54', 'Pour une fois, moi, je suis SATISFAIT (ou remboursé) !'),
(14, 2, 3, '2021-11-03 15:47:05', 'Ce que vous proposez fait parti des meilleurs ! ');

-- --------------------------------------------------------

--
-- Structure de la table `votes`
--

CREATE TABLE `votes` (
  `id` int(11) NOT NULL,
  `ref_id` int(11) NOT NULL DEFAULT '0',
  `ref` varchar(255) NOT NULL,
  `user_id` int(11) NOT NULL,
  `vote` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `votes`
--

INSERT INTO `votes` (`id`, `ref_id`, `ref`, `user_id`, `vote`) VALUES
(1, 1, 'acteurs', 1, 1);

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `acteurs`
--
ALTER TABLE `acteurs`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `posts`
--
ALTER TABLE `posts`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `votes`
--
ALTER TABLE `votes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `ref_id` (`ref_id`),
  ADD KEY `ref` (`ref`),
  ADD KEY `user_id` (`user_id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `acteurs`
--
ALTER TABLE `acteurs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT pour la table `posts`
--
ALTER TABLE `posts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT pour la table `votes`
--
ALTER TABLE `votes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
