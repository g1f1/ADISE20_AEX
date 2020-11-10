-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 11 Νοε 2020 στις 00:25:52
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

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `loginform`
--
ALTER TABLE `loginform`
  ADD PRIMARY KEY (`ID`);

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
