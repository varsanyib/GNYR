-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Gép: 127.0.0.1
-- Létrehozás ideje: 2022. Sze 30. 22:19
-- Kiszolgáló verziója: 10.4.24-MariaDB
-- PHP verzió: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Adatbázis: `gnyr`
--

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `autok`
--

CREATE TABLE `autok` (
  `frsz` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `autotipus` int(11) NOT NULL,
  `evjarat` year(4) NOT NULL,
  `szin` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `cre_time` datetime NOT NULL DEFAULT current_timestamp(),
  `mod_time` datetime NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `megjegyzes` varchar(250) COLLATE utf8_hungarian_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `autok`
--

INSERT INTO `autok` (`frsz`, `autotipus`, `evjarat`, `szin`, `cre_time`, `mod_time`, `megjegyzes`) VALUES
('TESZT01', 1, 2018, 'Fekete', '2022-09-30 20:31:10', '2022-09-30 20:31:10', 'Teszt adat'),
('TESZT02', 1, 2007, 'Fekete', '2022-09-30 22:05:38', '2022-09-30 22:05:38', 'Teszt adat');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `autotipusok`
--

CREATE TABLE `autotipusok` (
  `id` int(11) NOT NULL,
  `gyarto` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `tipus` varchar(50) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `autotipusok`
--

INSERT INTO `autotipusok` (`id`, `gyarto`, `tipus`) VALUES
(3, 'Ford', 'Ecosport'),
(5, 'Ford', 'Fiesta'),
(1, 'Ford', 'Focus'),
(8, 'Ford', 'Fusion'),
(2, 'Ford', 'Kuga'),
(9, 'Ford', 'Orion'),
(4, 'Ford', 'Ranger'),
(6, 'Ford', 'Transit'),
(11, 'Opel', 'Astra'),
(12, 'Opel', 'Corsa'),
(13, 'Opel', 'Insignia'),
(10, 'Opel', 'Vivaro'),
(18, 'Renault', 'Captur'),
(15, 'Renault', 'Espace'),
(17, 'Renault', 'Kadjar'),
(16, 'Renault', 'Modus'),
(14, 'Renault', 'Trafic'),
(19, 'Skoda', 'Fabia'),
(20, 'Skoda', 'Octavia'),
(21, 'Skoda', 'Superb'),
(28, 'Suzuki', 'Baleno'),
(23, 'Suzuki', 'Ignis'),
(22, 'Suzuki', 'Swift'),
(26, 'Suzuki', 'SX4'),
(27, 'Suzuki', 'SX4 S-Cross'),
(25, 'Suzuki', 'Vitara'),
(24, 'Suzuki', 'WagonR+');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `gyartok`
--

CREATE TABLE `gyartok` (
  `gyartonev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `gyartok`
--

INSERT INTO `gyartok` (`gyartonev`) VALUES
('Ford'),
('Opel'),
('Renault'),
('Skoda'),
('Suzuki');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `odometer`
--

CREATE TABLE `odometer` (
  `id` int(11) NOT NULL,
  `auto_id` varchar(50) COLLATE utf8_hungarian_ci NOT NULL,
  `allas` int(11) NOT NULL,
  `kep_url` varchar(100) COLLATE utf8_hungarian_ci NOT NULL,
  `megjegyzes` varchar(250) COLLATE utf8_hungarian_ci DEFAULT NULL,
  `cre_time` datetime NOT NULL DEFAULT current_timestamp(),
  `fenykep_time` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `odometer`
--

INSERT INTO `odometer` (`id`, `auto_id`, `allas`, `kep_url`, `megjegyzes`, `cre_time`, `fenykep_time`) VALUES
(1, 'TESZT01', 35543, 'TESZT01-20220719_0717.jpg', 'Teszt megjegyzés', '2022-09-30 21:10:57', '2022-07-19 07:17:00'),
(2, 'TESZT01', 35878, 'TESZT01-20220727_1913.jpg', NULL, '2022-09-30 21:10:57', '2022-07-27 19:13:00'),
(3, 'TESZT02', 118591, 'TESZT02-20220629_1232.jpg', 'Tankolás után', '2022-09-30 22:06:34', '2022-06-29 12:32:48'),
(4, 'TESZT02', 119694, 'TESZT02-20220817_0824.jpg', NULL, '2022-09-30 22:08:26', '2022-08-17 08:24:38'),
(5, 'TESZT02', 119905, 'TESZT02-20220831_1723.jpg', NULL, '2022-09-30 22:10:28', '2022-08-31 17:23:40');

-- --------------------------------------------------------

--
-- Tábla szerkezet ehhez a táblához `szinek`
--

CREATE TABLE `szinek` (
  `szinnev` varchar(50) COLLATE utf8_hungarian_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_hungarian_ci;

--
-- A tábla adatainak kiíratása `szinek`
--

INSERT INTO `szinek` (`szinnev`) VALUES
('Fehér'),
('Fekete'),
('Óceánkék'),
('Szürke');

--
-- Indexek a kiírt táblákhoz
--

--
-- A tábla indexei `autok`
--
ALTER TABLE `autok`
  ADD PRIMARY KEY (`frsz`),
  ADD KEY `fk_autotipusok` (`autotipus`),
  ADD KEY `fk_szinek` (`szin`);

--
-- A tábla indexei `autotipusok`
--
ALTER TABLE `autotipusok`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `gyarto` (`gyarto`,`tipus`);

--
-- A tábla indexei `gyartok`
--
ALTER TABLE `gyartok`
  ADD PRIMARY KEY (`gyartonev`);

--
-- A tábla indexei `odometer`
--
ALTER TABLE `odometer`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_autok_odo` (`auto_id`);

--
-- A tábla indexei `szinek`
--
ALTER TABLE `szinek`
  ADD PRIMARY KEY (`szinnev`);

--
-- A kiírt táblák AUTO_INCREMENT értéke
--

--
-- AUTO_INCREMENT a táblához `autotipusok`
--
ALTER TABLE `autotipusok`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT a táblához `odometer`
--
ALTER TABLE `odometer`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Megkötések a kiírt táblákhoz
--

--
-- Megkötések a táblához `autok`
--
ALTER TABLE `autok`
  ADD CONSTRAINT `fk_autotipusok` FOREIGN KEY (`autotipus`) REFERENCES `autotipusok` (`id`),
  ADD CONSTRAINT `fk_szinek` FOREIGN KEY (`szin`) REFERENCES `szinek` (`szinnev`);

--
-- Megkötések a táblához `autotipusok`
--
ALTER TABLE `autotipusok`
  ADD CONSTRAINT `fk_gyartok` FOREIGN KEY (`gyarto`) REFERENCES `gyartok` (`gyartonev`);

--
-- Megkötések a táblához `odometer`
--
ALTER TABLE `odometer`
  ADD CONSTRAINT `fk_autok_odo` FOREIGN KEY (`auto_id`) REFERENCES `autok` (`frsz`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
