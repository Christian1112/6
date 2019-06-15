-- phpMyAdmin SQL Dump
-- version 4.8.5
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Erstellungszeit: 15. Jun 2019 um 14:21
-- Server-Version: 10.1.38-MariaDB
-- PHP-Version: 7.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Datenbank: `christiansimic_cr6`
--

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `class`
--

CREATE TABLE `class` (
  `class_id` int(11) NOT NULL,
  `className` varchar(5) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `class`
--

INSERT INTO `class` (`V_class_id`, `className`) VALUES
(1, '1a'),
(2, '1b'),
(3, '2a'),
(4, '4b');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

CREATE TABLE `student` (
  `student_id` int(11) NOT NULL,
  `student_name` varchar(55) DEFAULT NULL,
  `student_surname` varchar(55) DEFAULT NULL,
  `student_email` varchar(55) DEFAULT NULL,
  `V_class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `student`
--

INSERT INTO `student` (`student_id`, `student_name`, `student_surname`, `student_email`, `V_class_id`) VALUES
(1, 'Sebastian', 'Simic', 'xxhotmail.com', 1),
(2, 'Ronald', 'Duck', 'xdhotmail.com', 1),
(3, 'Princess', 'Nice', 'xähotmail.com', 2),
(4, 'Horn', 'Plone', 'xohotmail.com', 2),
(5, 'Pocahontas', 'Love', 'xöhotmail.com', 2),
(6, 'James', 'Brutal', 'xlhotmail.com', 3),
(7, 'Thomas', 'Lahm', 'xkhotmail.com', 3),
(8, 'Michalea', 'Nam', 'xfhotmail.com', 3),
(9, 'John', 'Doe', 'xehotmail.com', 4),
(10, 'Tim', 'Frim', 'xwhotmail.com', 4),

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teacher`
--

CREATE TABLE `teacher` (
  `teacher_id` int(11) NOT NULL,
  `teacher_name` varchar(55) DEFAULT NULL,
  `teacher_surname` varchar(55) DEFAULT NULL,
  `teacher_emal` varchar(55) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teacher`
--

INSERT INTO `teacher` (`teacher_id`, `teacher_name`, `teacher_surname`, `teacher_email`) VALUES
(1, 'Maria', 'Klaax', 'ads@hotmsil.com'),
(2, 'Hoho', 'Rolo', 'jads@hotmsil.com'),
(3, 'Lara', 'Rala', 'ass@hotmsil.com'),
(4, 'Rick', 'Ron', 'jads@hotmsil.com');

-- --------------------------------------------------------

--
-- Tabellenstruktur für Tabelle `teach`
--

CREATE TABLE `teach` (
  `teach_id` int(11) NOT NULL,
  `V_teacher_id` int(11) DEFAULT NULL,
  `V_class_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Daten für Tabelle `teach`
--

INSERT INTO `teach` (`V_teacher_id`, `V_class_id`) VALUES
(1, 1),
(1, 2),
(1, 3),
(2, 4),
(2, 1),
(2, 2),
(3, 3),
(3, 4),
(4, 1),
(4, 2);

--
-- Indizes der exportierten Tabellen
--

--
-- Indizes für die Tabelle `class`
--
ALTER TABLE `class`
  ADD PRIMARY KEY (`V_class_id`);

--
-- Indizes für die Tabelle `student`
--
ALTER TABLE `student`
  ADD PRIMARY KEY (`student_id`),
  ADD KEY `V_class_id` (`V_class_id`);

--
-- Indizes für die Tabelle `teacher`
--
ALTER TABLE `teacher`
  ADD PRIMARY KEY (`teacher_id`);

--
-- Indizes für die Tabelle `teach`
--
ALTER TABLE `teach`
  ADD PRIMARY KEY (`teach_id`),
  ADD KEY `V_teacher_id` (`V_teacher_id`),
  ADD KEY `V_class_id` (`V_class_id`);

--
-- AUTO_INCREMENT für exportierte Tabellen
--

--
-- AUTO_INCREMENT für Tabelle `class`
--
ALTER TABLE `class`
  MODIFY `class_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `student`
--
ALTER TABLE `student`
  MODIFY `student_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT für Tabelle `teacher`
--
ALTER TABLE `teacher`
  MODIFY `teacher_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT für Tabelle `teach`
--
ALTER TABLE `teach`
  MODIFY `teach_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- Constraints der exportierten Tabellen
--

--
-- Constraints der Tabelle `student`
--
ALTER TABLE `student`
  ADD CONSTRAINT `student_ibV_1` FOREIGN KEY (`V_class_id`) REFERENCES `class` (`class_id`);

--
-- Constraints der Tabelle `teach`
--
ALTER TABLE `teach`
  ADD CONSTRAINT `teach_ibV_1` FOREIGN KEY (`V_teacher_id`) REFERENCES `teacher` (`teacher_id`),
  ADD CONSTRAINT `teach_ibV_2` FOREIGN KEY (`V_class_id`) REFERENCES `class` (`class_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;