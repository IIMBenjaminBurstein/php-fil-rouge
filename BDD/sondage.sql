-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Hôte : localhost:3306
-- Généré le : mar. 15 déc. 2020 à 17:34
-- Version du serveur :  5.7.24
-- Version de PHP : 7.4.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données : `sondage`
--

-- --------------------------------------------------------

--
-- Structure de la table `answer`
--

CREATE TABLE `answer` (
  `answer_id` int(11) NOT NULL,
  `id_question_id` int(11) NOT NULL,
  `choix` varchar(250) NOT NULL,
  `nombre` int(11) NOT NULL DEFAULT '0',
  `resultat` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `friend`
--

CREATE TABLE `friend` (
  `friend_id` int(11) NOT NULL,
  `user_id_A` int(11) NOT NULL,
  `user_id_B` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `friend`
--

INSERT INTO `friend` (`friend_id`, `user_id_A`, `user_id_B`) VALUES
(2, 2, 1);

-- --------------------------------------------------------

--
-- Structure de la table `question`
--

CREATE TABLE `question` (
  `question_id` int(11) NOT NULL,
  `user_id_author` int(11) NOT NULL,
  `question` varchar(255) NOT NULL,
  `image` varchar(10000) NOT NULL,
  `date_fin` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `nom` varchar(50) NOT NULL,
  `prenom` varchar(50) NOT NULL,
  `pseudo` varchar(50) NOT NULL,
  `email` varchar(250) NOT NULL,
  `mdp` varchar(150) NOT NULL,
  `statut` tinyint(1) NOT NULL DEFAULT '0',
  `date` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Déchargement des données de la table `user`
--

INSERT INTO `user` (`id`, `nom`, `prenom`, `pseudo`, `email`, `mdp`, `statut`, `date`) VALUES
(1, 'burstein', 'Benjamin', 'benji', 'benjamin.burstein94@gmail.com', '$2y$10$c.qfDSa2oAIraNojzcr9H.JUn4LQ4gwBdoT7n8RWD2wketYpPvyXe', 0, '2020-12-03'),
(2, 'admin', 'admin', 'admin', 'a@a', '$2y$10$6imPo6toaxwZYfP.I6IlkuvR6Ped.MptK37YU/0.zODIaMq0SL7J.', 1, '2020-12-07');

-- --------------------------------------------------------

--
-- Structure de la table `user_answer`
--

CREATE TABLE `user_answer` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `answer_id` int(11) NOT NULL,
  `id_question` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Structure de la table `user_comment`
--

CREATE TABLE `user_comment` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `id_question_id` int(11) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `date` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Index pour les tables déchargées
--

--
-- Index pour la table `answer`
--
ALTER TABLE `answer`
  ADD PRIMARY KEY (`answer_id`);

--
-- Index pour la table `friend`
--
ALTER TABLE `friend`
  ADD PRIMARY KEY (`friend_id`),
  ADD UNIQUE KEY `friend_id` (`friend_id`);

--
-- Index pour la table `question`
--
ALTER TABLE `question`
  ADD PRIMARY KEY (`question_id`);

--
-- Index pour la table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `Id` (`id`,`pseudo`,`email`);

--
-- Index pour la table `user_answer`
--
ALTER TABLE `user_answer`
  ADD PRIMARY KEY (`id`);

--
-- Index pour la table `user_comment`
--
ALTER TABLE `user_comment`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT pour les tables déchargées
--

--
-- AUTO_INCREMENT pour la table `answer`
--
ALTER TABLE `answer`
  MODIFY `answer_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `friend`
--
ALTER TABLE `friend`
  MODIFY `friend_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `question`
--
ALTER TABLE `question`
  MODIFY `question_id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT pour la table `user_answer`
--
ALTER TABLE `user_answer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT pour la table `user_comment`
--
ALTER TABLE `user_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
