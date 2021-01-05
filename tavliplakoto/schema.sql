-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Φιλοξενητής: 127.0.0.1
-- Χρόνος δημιουργίας: 05 Ιαν 2021 στις 22:20:31
-- Έκδοση διακομιστή: 10.4.13-MariaDB
-- Έκδοση PHP: 7.4.7

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Βάση δεδομένων: `adise20_chess11`
--

DELIMITER $$
--
-- Διαδικασίες
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `clean_board` ()  BEGIN
	replace into board select * from board_empty;
	update `players` set username=null, token=null;
    update `game_status` set `status`='not active', `p_turn`=null, `result`=null;
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `move_piece` (`x1` TINYINT, `y1` TINYINT, `x2` TINYINT, `y2` TINYINT)  BEGIN
	declare  p, p_color char;
	
	select  piece, piece_color into p, p_color FROM `board` WHERE X=x1 AND Y=y1;
	
	update board
	set piece=p, piece_color=p_color
	where x=x2 and y=y2;
	
	UPDATE board
	SET piece=null,piece_color=null
	WHERE X=x1 AND Y=y1;
	update game_status set p_turn=if(p_color='W','B','W');
	
    END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `test_move` ()  BEGIN
SELECT * FROM
board B1 INNER JOIN board B2
WHERE B1.x=2 AND B1.y=2
AND (B2.`piece_color` IS NULL OR B2.`piece_color`<>B1.`piece_color`)
AND B1.x=B2.x AND B1.y<B2.y AND (B2.y-B1.y)<=2 ;
    END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board`
--

CREATE TABLE `board` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `piece` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `board`
--

INSERT INTO `board` (`x`, `y`, `b_color`, `piece_color`, `piece`) VALUES
(0, 0, 'B', NULL, NULL),
(1, 0, 'B', NULL, NULL),
(14, 0, 'B', NULL, NULL),
(1, 1, 'B', NULL, NULL),
(2, 1, 'W', NULL, NULL),
(3, 1, 'B', NULL, NULL),
(4, 1, 'W', NULL, NULL),
(5, 1, 'B', NULL, NULL),
(6, 1, 'W', NULL, NULL),
(7, 1, 'B', NULL, NULL),
(8, 1, 'W', NULL, NULL),
(9, 1, '', NULL, NULL),
(10, 1, '', NULL, NULL),
(11, 1, '', NULL, NULL),
(12, 1, '', NULL, NULL),
(13, 1, '', NULL, NULL),
(14, 1, '', NULL, NULL),
(15, 1, '', NULL, NULL),
(1, 2, 'W', NULL, NULL),
(2, 2, 'B', NULL, NULL),
(3, 2, 'W', NULL, NULL),
(4, 2, 'B', NULL, NULL),
(5, 2, 'W', NULL, NULL),
(6, 2, 'B', NULL, NULL),
(7, 2, 'W', NULL, NULL),
(8, 2, 'B', NULL, NULL),
(9, 2, '', NULL, NULL),
(10, 2, '', NULL, NULL),
(11, 2, '', NULL, NULL),
(12, 2, '', NULL, NULL),
(13, 2, '', NULL, NULL),
(14, 2, 'W', 'W', 'P15'),
(15, 2, '', NULL, NULL),
(1, 3, 'B', NULL, NULL),
(2, 3, 'W', NULL, NULL),
(3, 3, 'B', NULL, NULL),
(4, 3, 'W', NULL, NULL),
(5, 3, 'B', NULL, NULL),
(6, 3, 'W', NULL, NULL),
(7, 3, 'B', NULL, NULL),
(8, 3, 'W', NULL, NULL),
(9, 3, '', NULL, NULL),
(10, 3, '', NULL, NULL),
(11, 3, '', NULL, NULL),
(12, 3, '', NULL, NULL),
(13, 3, '', NULL, NULL),
(14, 3, 'W', 'W', 'P2'),
(15, 3, 'W', 'W', 'P14'),
(1, 4, 'W', NULL, NULL),
(2, 4, 'B', NULL, NULL),
(3, 4, 'W', NULL, NULL),
(4, 4, 'B', NULL, NULL),
(5, 4, 'W', NULL, NULL),
(6, 4, 'B', NULL, NULL),
(7, 4, 'W', NULL, NULL),
(8, 4, 'B', NULL, NULL),
(9, 4, '', NULL, NULL),
(10, 4, '', NULL, NULL),
(11, 4, '', NULL, NULL),
(12, 4, '', NULL, NULL),
(13, 4, '', NULL, NULL),
(14, 4, 'W', 'W', 'P1'),
(15, 4, 'W', 'W', 'P13'),
(1, 5, 'B', NULL, NULL),
(2, 5, 'W', NULL, NULL),
(3, 5, 'B', NULL, NULL),
(4, 5, 'W', NULL, NULL),
(5, 5, 'B', NULL, NULL),
(6, 5, 'W', NULL, NULL),
(7, 5, 'B', NULL, NULL),
(8, 5, 'W', NULL, NULL),
(9, 5, '', NULL, NULL),
(10, 5, '', NULL, NULL),
(11, 5, '', NULL, NULL),
(12, 5, '', NULL, NULL),
(13, 5, '', NULL, NULL),
(14, 5, 'W', 'W', 'P3'),
(15, 5, 'W', 'W', 'P12'),
(1, 6, 'W', NULL, NULL),
(2, 6, 'B', NULL, NULL),
(3, 6, 'W', NULL, NULL),
(4, 6, 'B', NULL, NULL),
(5, 6, 'W', NULL, NULL),
(6, 6, 'B', NULL, NULL),
(7, 6, 'W', NULL, NULL),
(8, 6, 'B', NULL, NULL),
(9, 6, '', NULL, NULL),
(10, 6, '', NULL, NULL),
(11, 6, '', NULL, NULL),
(12, 6, '', NULL, NULL),
(13, 6, '', NULL, NULL),
(14, 6, 'W', 'W', 'P4'),
(15, 6, 'W', 'W', 'P13'),
(1, 7, 'B', 'B', NULL),
(2, 7, 'W', 'B', NULL),
(3, 7, 'B', 'B', NULL),
(4, 7, 'W', 'B', NULL),
(5, 7, 'B', 'B', NULL),
(6, 7, 'W', 'B', NULL),
(7, 7, 'B', 'B', NULL),
(8, 7, 'W', 'B', NULL),
(9, 7, '', NULL, NULL),
(10, 7, '', NULL, NULL),
(11, 7, '', NULL, NULL),
(12, 7, '', NULL, NULL),
(13, 7, '', NULL, NULL),
(14, 7, 'W', 'W', 'P5'),
(15, 7, 'W', 'W', 'P10'),
(1, 8, 'W', 'B', NULL),
(2, 8, 'B', 'B', NULL),
(3, 8, 'W', 'B', NULL),
(4, 8, 'B', 'B', NULL),
(5, 8, 'W', 'B', NULL),
(6, 8, 'B', 'B', NULL),
(7, 8, 'W', 'B', NULL),
(8, 8, 'B', 'B', NULL),
(9, 8, '', NULL, NULL),
(10, 8, '', NULL, NULL),
(11, 8, '', NULL, NULL),
(12, 8, '', NULL, NULL),
(13, 8, '', NULL, NULL),
(14, 8, 'W', 'W', 'P6'),
(15, 8, 'W', 'W', 'P9'),
(1, 9, 'W', NULL, NULL),
(2, 9, '', NULL, NULL),
(3, 9, '', NULL, NULL),
(4, 9, '', NULL, NULL),
(5, 9, '', NULL, NULL),
(6, 9, '', NULL, NULL),
(7, 9, '', NULL, NULL),
(8, 9, '', NULL, NULL),
(9, 9, '', NULL, NULL),
(10, 9, '', NULL, NULL),
(11, 9, '', NULL, NULL),
(12, 9, '', NULL, NULL),
(13, 9, '', NULL, NULL),
(14, 9, 'W', 'W', 'P7'),
(15, 9, 'W', 'W', 'P8'),
(1, 10, 'W', NULL, NULL),
(2, 10, '', NULL, NULL),
(3, 10, '', NULL, NULL),
(4, 10, '', NULL, NULL),
(5, 10, '', NULL, NULL),
(6, 10, '', NULL, NULL),
(7, 10, '', NULL, NULL),
(8, 10, '', NULL, NULL),
(9, 10, '', NULL, NULL),
(10, 10, '', NULL, NULL),
(11, 10, '', NULL, NULL),
(12, 10, '', NULL, NULL),
(13, 10, '', NULL, NULL),
(14, 10, 'W', 'W', NULL),
(15, 10, '', NULL, NULL),
(1, 11, 'W', NULL, NULL),
(2, 11, '', NULL, NULL),
(3, 11, '', NULL, NULL),
(4, 11, '', NULL, NULL),
(5, 11, '', NULL, NULL),
(6, 11, '', NULL, NULL),
(7, 11, '', NULL, NULL),
(8, 11, '', NULL, NULL),
(9, 11, '', NULL, NULL),
(10, 11, '', NULL, NULL),
(11, 11, '', NULL, NULL),
(12, 11, '', NULL, NULL),
(13, 11, '', NULL, NULL),
(14, 11, 'B', 'B', 'P7'),
(15, 11, 'B', 'B', 'P8'),
(1, 12, 'W', NULL, NULL),
(2, 12, '', NULL, NULL),
(3, 12, '', NULL, NULL),
(4, 12, '', NULL, NULL),
(5, 12, '', NULL, NULL),
(6, 12, '', NULL, NULL),
(7, 12, '', NULL, NULL),
(8, 12, '', NULL, NULL),
(9, 12, '', NULL, NULL),
(10, 12, '', NULL, NULL),
(11, 12, '', NULL, NULL),
(12, 12, '', NULL, NULL),
(13, 12, '', NULL, NULL),
(14, 12, 'B', 'B', 'P7'),
(15, 12, 'B', 'B', 'P8'),
(1, 13, 'B', NULL, NULL),
(2, 13, '', NULL, NULL),
(3, 13, '', NULL, NULL),
(4, 13, '', NULL, NULL),
(5, 13, '', NULL, NULL),
(6, 13, '', NULL, NULL),
(7, 13, '', NULL, NULL),
(8, 13, '', NULL, NULL),
(9, 13, '', NULL, NULL),
(10, 13, '', NULL, NULL),
(11, 13, '', NULL, NULL),
(12, 13, '', NULL, NULL),
(13, 13, '', NULL, NULL),
(14, 13, 'B', 'B', 'P6'),
(15, 13, 'B', 'B', 'P10'),
(1, 14, '', NULL, NULL),
(2, 14, '', NULL, NULL),
(3, 14, '', NULL, NULL),
(4, 14, '', NULL, NULL),
(5, 14, '', NULL, NULL),
(6, 14, '', NULL, NULL),
(7, 14, '', NULL, NULL),
(8, 14, '', NULL, NULL),
(9, 14, '', NULL, NULL),
(10, 14, '', NULL, NULL),
(11, 14, '', NULL, NULL),
(12, 14, '', NULL, NULL),
(13, 14, '', NULL, NULL),
(14, 14, 'B', 'B', 'P4'),
(15, 14, 'B', 'B', 'P11'),
(1, 15, '', NULL, NULL),
(2, 15, '', NULL, NULL),
(3, 15, '', NULL, NULL),
(4, 15, '', NULL, NULL),
(5, 15, '', NULL, NULL),
(6, 15, '', NULL, NULL),
(7, 15, '', NULL, NULL),
(8, 15, '', NULL, NULL),
(9, 15, '', NULL, NULL),
(10, 15, '', NULL, NULL),
(11, 15, '', NULL, NULL),
(12, 15, '', NULL, NULL),
(13, 15, '', NULL, NULL),
(14, 15, 'B', 'B', 'P3'),
(15, 15, 'B', 'B', 'P12'),
(1, 16, '', NULL, NULL),
(2, 16, '', NULL, NULL),
(3, 16, '', NULL, NULL),
(4, 16, '', NULL, NULL),
(5, 16, '', NULL, NULL),
(6, 16, '', NULL, NULL),
(7, 16, '', NULL, NULL),
(8, 16, '', NULL, NULL),
(9, 16, '', NULL, NULL),
(10, 16, '', NULL, NULL),
(11, 16, '', NULL, NULL),
(12, 16, 'B', NULL, NULL),
(13, 16, '', NULL, NULL),
(14, 16, 'B', 'B', 'P5'),
(15, 16, 'B', 'B', 'P13'),
(1, 17, '', NULL, NULL),
(2, 17, '', NULL, NULL),
(3, 17, '', NULL, NULL),
(4, 17, '', NULL, NULL),
(5, 17, '', NULL, NULL),
(6, 17, '', NULL, NULL),
(7, 17, '', NULL, NULL),
(8, 17, '', NULL, NULL),
(9, 17, '', NULL, NULL),
(10, 17, '', NULL, NULL),
(11, 17, '', NULL, NULL),
(12, 17, '', NULL, NULL),
(13, 17, '', NULL, NULL),
(14, 17, 'B', 'B', 'P1'),
(15, 17, 'B', 'B', 'P14'),
(1, 18, '', NULL, NULL),
(2, 18, '', NULL, NULL),
(3, 18, '', NULL, NULL),
(4, 18, '', NULL, NULL),
(5, 18, '', NULL, NULL),
(6, 18, '', NULL, NULL),
(7, 18, '', NULL, NULL),
(8, 18, '', NULL, NULL),
(9, 18, '', NULL, NULL),
(10, 18, '', NULL, NULL),
(11, 18, '', NULL, NULL),
(12, 18, '', NULL, NULL),
(13, 18, '', NULL, NULL),
(14, 18, 'B', 'B', 'P15'),
(15, 18, 'W', 'B', NULL),
(1, 19, 'B', NULL, NULL),
(2, 19, 'B', NULL, NULL),
(3, 19, 'B', NULL, NULL),
(4, 19, 'B', NULL, NULL),
(5, 19, 'B', NULL, NULL),
(6, 19, 'B', NULL, NULL),
(7, 19, 'B', NULL, NULL),
(8, 19, '', NULL, NULL),
(9, 19, 'B', NULL, NULL),
(10, 19, 'B', NULL, NULL),
(11, 19, 'B', NULL, NULL),
(12, 19, 'B', NULL, NULL),
(13, 19, '', NULL, NULL),
(14, 19, 'B', 'B', NULL),
(15, 19, 'B', NULL, NULL),
(14, 20, 'B', 'B', NULL),
(15, 20, 'B', 'B', 'P2'),
(14, 21, 'B', 'B', NULL);

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `board_empty`
--

CREATE TABLE `board_empty` (
  `x` tinyint(1) NOT NULL,
  `y` tinyint(1) NOT NULL,
  `b_color` enum('B','W') NOT NULL,
  `piece_color` enum('W','B') DEFAULT NULL,
  `piece` enum('P1','P2','P3','P4','P5','P6','P7','P8','P9','P10','P11','P12','P13','P14','P15') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `board_empty`
--

INSERT INTO `board_empty` (`x`, `y`, `b_color`, `piece_color`, `piece`) VALUES
(15, 1, '', NULL, NULL),
(14, 2, 'W', 'W', 'P15'),
(15, 2, '', NULL, NULL),
(14, 3, 'W', 'W', 'P2'),
(15, 3, 'W', 'W', 'P14'),
(14, 4, 'W', 'W', 'P1'),
(15, 4, 'W', 'W', 'P13'),
(14, 5, 'W', 'W', 'P3'),
(15, 5, 'W', 'W', 'P12'),
(14, 6, 'W', 'W', 'P4'),
(15, 6, 'W', 'W', 'P13'),
(14, 7, 'W', 'W', 'P5'),
(15, 7, 'W', 'W', 'P10'),
(14, 8, 'W', 'W', 'P6'),
(15, 8, 'W', 'W', 'P9'),
(14, 9, 'W', 'W', 'P7'),
(15, 9, 'W', 'W', 'P8'),
(15, 10, '', NULL, NULL),
(14, 11, 'B', 'B', 'P7'),
(15, 11, 'B', 'B', 'P8'),
(14, 12, 'B', 'B', 'P7'),
(15, 12, 'B', 'B', 'P8'),
(14, 13, 'B', 'B', 'P6'),
(15, 13, 'B', 'B', 'P10'),
(14, 14, 'B', 'B', 'P4'),
(15, 14, 'B', 'B', 'P11'),
(14, 15, 'B', 'B', 'P3'),
(15, 15, 'B', 'B', 'P12'),
(14, 16, 'B', 'B', 'P5'),
(15, 16, 'B', 'B', 'P13'),
(14, 17, 'B', 'B', 'P1'),
(15, 17, 'B', 'B', 'P14'),
(14, 18, 'B', 'B', 'P15'),
(15, 18, 'W', 'B', NULL),
(15, 19, 'B', NULL, NULL),
(15, 20, 'B', 'B', 'P2');

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `game_status`
--

CREATE TABLE `game_status` (
  `status` enum('not active','initialized','started','ended','aborded') NOT NULL DEFAULT 'not active',
  `p_turn` enum('W','B') DEFAULT NULL,
  `result` enum('B','W','D') DEFAULT NULL,
  `last_change` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `game_status`
--

INSERT INTO `game_status` (`status`, `p_turn`, `result`, `last_change`) VALUES
('aborded', NULL, 'B', '2021-01-05 21:13:07');

--
-- Δείκτες `game_status`
--
DELIMITER $$
CREATE TRIGGER `game_status_update` BEFORE UPDATE ON `game_status` FOR EACH ROW BEGIN
		set NEW.last_change = now();
    END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Δομή πίνακα για τον πίνακα `players`
--

CREATE TABLE `players` (
  `username` varchar(20) DEFAULT NULL,
  `piece_color` enum('B','W') NOT NULL,
  `token` varchar(100) DEFAULT NULL,
  `last_action` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Άδειασμα δεδομένων του πίνακα `players`
--

INSERT INTO `players` (`username`, `piece_color`, `token`, `last_action`) VALUES
('sdfsdafsdfaf', 'B', '495e35b7e76878d2db0011c2c38c4476', NULL),
('sdfsdfafasdads', 'W', '9079c9d952c847a9bb8ec1c3b6ec48cf', NULL);

--
-- Ευρετήρια για άχρηστους πίνακες
--

--
-- Ευρετήρια για πίνακα `board`
--
ALTER TABLE `board`
  ADD PRIMARY KEY (`y`,`x`);

--
-- Ευρετήρια για πίνακα `board_empty`
--
ALTER TABLE `board_empty`
  ADD PRIMARY KEY (`y`,`x`);

--
-- Ευρετήρια για πίνακα `players`
--
ALTER TABLE `players`
  ADD PRIMARY KEY (`piece_color`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
