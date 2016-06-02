-- phpMyAdmin SQL Dump
-- version 4.5.2
-- http://www.phpmyadmin.net
--
-- Client :  127.0.0.1
-- Généré le :  Mar 31 Mai 2016 à 12:29
-- Version du serveur :  5.7.9
-- Version de PHP :  5.6.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de données :  `projet_java`
--

-- --------------------------------------------------------

--
-- Structure de la table `message`
--

DROP TABLE IF EXISTS `message`;
CREATE TABLE IF NOT EXISTS `message` (
  `idMessage` int(11) NOT NULL AUTO_INCREMENT,
  `timestampmessage` datetime DEFAULT NULL,
  `contenu` varchar(200) DEFAULT NULL,
  `auteur` varchar(25) DEFAULT NULL,
  `idUser` int(11) DEFAULT NULL,
  `idSalon` int(11) DEFAULT NULL,
  PRIMARY KEY (`idMessage`),
  KEY `FK_message_idUser` (`idUser`),
  KEY `FK_message_idSalon` (`idSalon`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `salons`
--

DROP TABLE IF EXISTS `salons`;
CREATE TABLE IF NOT EXISTS `salons` (
  `idSalon` int(11) NOT NULL AUTO_INCREMENT,
  `intitule` varchar(25) DEFAULT NULL,
  `couleur` varchar(9) DEFAULT 'white',
  `description` varchar(75) DEFAULT NULL,
  PRIMARY KEY (`idSalon`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utilisateurs`
--

DROP TABLE IF EXISTS `utilisateurs`;
CREATE TABLE IF NOT EXISTS `utilisateurs` (
  `idUser` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(25) DEFAULT NULL,
  `password` varchar(200) NOT NULL,
  `prenom` varchar(25) DEFAULT NULL,
  `nom` varchar(25) DEFAULT NULL,
  `typeprofil` varchar(25) DEFAULT NULL,
  `description` varchar(25) DEFAULT NULL,
  `estConnecte` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`idUser`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Structure de la table `utiliser`
--

DROP TABLE IF EXISTS `utiliser`;
CREATE TABLE IF NOT EXISTS `utiliser` (
  `idUser` int(11) NOT NULL,
  `idSalon` int(11) NOT NULL,
  `role` int(1) DEFAULT '0' COMMENT '0 = Spectateur, 1 = Rédacteur',
  PRIMARY KEY (`idUser`,`idSalon`),
  KEY `FK_utiliser_idSalon` (`idSalon`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Contraintes pour les tables exportées
--

--
-- Contraintes pour la table `message`
--
ALTER TABLE `message`
  ADD CONSTRAINT `FK_message_idSalon` FOREIGN KEY (`idSalon`) REFERENCES `salons` (`idSalon`),
  ADD CONSTRAINT `FK_message_idUser` FOREIGN KEY (`idUser`) REFERENCES `utilisateurs` (`idUser`);

--
-- Contraintes pour la table `utiliser`
--
ALTER TABLE `utiliser`
  ADD CONSTRAINT `FK_utiliser_idSalon` FOREIGN KEY (`idSalon`) REFERENCES `salons` (`idSalon`),
  ADD CONSTRAINT `FK_utiliser_idUser` FOREIGN KEY (`idUser`) REFERENCES `utilisateurs` (`idUser`);

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
