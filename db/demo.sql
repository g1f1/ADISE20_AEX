-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 04 Δεκ 2020 στις 11:42:15
-- Έκδοση διακομιστή: 10.4.14-MariaDB
-- Έκδοση PHP: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `demo`
--

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `piece` enum('K','Q','R','B','N','P') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','\r\nended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') DEFAULT NULL,
  `result` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `loginform`
--

CREATE TABLE `loginform` (
  `ID` int(11) NOT NULL,
  `User` varchar(50) NOT NULL,
  `Pass` varchar(50) NOT NULL,
  `Email` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Άδειασμα δεδομένων του πίνακα `loginform`
--

INSERT INTO `loginform` (`ID`, `User`, `Pass`, `Email`) VALUES
(1, 'admin', 'admin', NULL),
(2, '', '', NULL),
(3, '', '', NULL),
(26, 'ELENH', '', 'elenhka98@gmail.com'),
(28, 'ELENH', '', 'elenhka98@gmail.com'),
(29, 'admin', '', 'HAPPYVALENTINECAT98@GMAIL.COM');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','W') NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`x`,`y`);

--
-- Ευρετήρια για πίνακα `loginform`
--
ALTER TABLE `loginform`
  ADD PRIMARY KEY (`ID`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`piece_color`);

--
-- AUTO_INCREMENT για άχρηστους πίνακες
--

--
-- AUTO_INCREMENT για πίνακα `loginform`
--
ALTER TABLE `loginform`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=30;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
