-- phpMyAdmin SQL Dump
-- version 4.7.1
-- https://www.phpmyadmin.net/
--
-- Хост: sql11.freemysqlhosting.net
-- Время создания: Май 27 2021 г., 22:48
-- Версия сервера: 5.5.62-0ubuntu0.14.04.1
-- Версия PHP: 7.0.33-0ubuntu0.16.04.16

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- База данных: `sql11415373`
--
CREATE DATABASE IF NOT EXISTS `sql11415373` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `sql11415373`;

-- --------------------------------------------------------

--
-- Структура таблицы `Addres`
--

CREATE TABLE `Addres` (
  `ID` int(11) NOT NULL,
  `ID_City` int(11) NOT NULL,
  `ID_Street` int(11) NOT NULL,
  `ID_House` int(11) NOT NULL,
  `ID_Building` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Addres`
--

INSERT INTO `Addres` (`ID`, `ID_City`, `ID_Street`, `ID_House`, `ID_Building`) VALUES
(1, 1, 1, 1, 1),
(2, 1, 2, 2, 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Apteka`
--

CREATE TABLE `Apteka` (
  `ID` int(11) NOT NULL,
  `ID_Addres` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `PhoneNum` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Apteka`
--

INSERT INTO `Apteka` (`ID`, `ID_Addres`, `Name`, `PhoneNum`) VALUES
(1, 1, 'Lomtick', '89542890254');

-- --------------------------------------------------------

--
-- Структура таблицы `Building`
--

CREATE TABLE `Building` (
  `ID` int(11) NOT NULL,
  `Building` int(11) NOT NULL,
  `ID_House` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Building`
--

INSERT INTO `Building` (`ID`, `Building`, `ID_House`) VALUES
(1, 1, 2),
(2, 2, 1);

-- --------------------------------------------------------

--
-- Структура таблицы `City`
--

CREATE TABLE `City` (
  `ID` int(11) NOT NULL,
  `City` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `City`
--

INSERT INTO `City` (`ID`, `City`) VALUES
(1, 'Moscow');

-- --------------------------------------------------------

--
-- Структура таблицы `Client`
--

CREATE TABLE `Client` (
  `ID` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL,
  `Surname` varchar(100) NOT NULL,
  `PhoneNum` varchar(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Client`
--

INSERT INTO `Client` (`ID`, `Name`, `Surname`, `PhoneNum`) VALUES
(1, 'Alex', 'Kartashov', '89855120459'),
(2, 'Dima', 'Kudryashov', '89125634587'),
(3, 'Anna', 'Lekseevna', '89456205042'),
(4, 'Daniil', 'Gromov', '89054562052');

-- --------------------------------------------------------

--
-- Структура таблицы `House`
--

CREATE TABLE `House` (
  `ID` int(11) NOT NULL,
  `House` varchar(100) NOT NULL,
  `ID_Street` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `House`
--

INSERT INTO `House` (`ID`, `House`, `ID_Street`) VALUES
(1, '1', 1),
(2, '2', 2);

-- --------------------------------------------------------

--
-- Структура таблицы `Lekarstva`
--

CREATE TABLE `Lekarstva` (
  `ID` int(11) NOT NULL,
  `Price` int(11) NOT NULL,
  `InceptDate` date NOT NULL,
  `Quantity` int(11) NOT NULL,
  `ExpireDate` date NOT NULL,
  `ID_Pharmancy` int(11) NOT NULL,
  `Name` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Lekarstva`
--

INSERT INTO `Lekarstva` (`ID`, `Price`, `InceptDate`, `Quantity`, `ExpireDate`, `ID_Pharmancy`, `Name`) VALUES
(1, 2000, '2021-05-13', 50, '2021-10-30', 1, 'Ofobozol'),
(2, 1000, '2021-05-05', 30, '2022-02-18', 1, 'Pentalgin');

-- --------------------------------------------------------

--
-- Структура таблицы `Street`
--

CREATE TABLE `Street` (
  `ID` int(11) NOT NULL,
  `Street` varchar(100) NOT NULL,
  `ID_City` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Street`
--

INSERT INTO `Street` (`ID`, `Street`, `ID_City`) VALUES
(1, 'Ogorodniy proezd', 1),
(2, 'Tverskaya', 1);

-- --------------------------------------------------------

--
-- Структура таблицы `Zakaz`
--

CREATE TABLE `Zakaz` (
  `ID` int(11) NOT NULL,
  `ID_Client` int(11) NOT NULL,
  `ID_Drug` int(11) NOT NULL,
  `OrderNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Дамп данных таблицы `Zakaz`
--

INSERT INTO `Zakaz` (`ID`, `ID_Client`, `ID_Drug`, `OrderNumber`) VALUES
(1, 1, 1, 1),
(2, 4, 2, 2),
(3, 1, 2, 1),
(4, 3, 1, 4),
(5, 2, 2, 5);

--
-- Индексы сохранённых таблиц
--

--
-- Индексы таблицы `Addres`
--
ALTER TABLE `Addres`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`ID_Street`,`ID_House`,`ID_Building`),
  ADD KEY `ID_Street` (`ID_Street`),
  ADD KEY `ID_House` (`ID_House`),
  ADD KEY `ID_Building` (`ID_Building`),
  ADD KEY `ID_City` (`ID_City`);

--
-- Индексы таблицы `Apteka`
--
ALTER TABLE `Apteka`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`ID_Addres`,`Name`,`PhoneNum`),
  ADD KEY `ID_Addres` (`ID_Addres`);

--
-- Индексы таблицы `Building`
--
ALTER TABLE `Building`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`Building`,`ID_House`),
  ADD KEY `ID_House` (`ID_House`);

--
-- Индексы таблицы `City`
--
ALTER TABLE `City`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`City`);

--
-- Индексы таблицы `Client`
--
ALTER TABLE `Client`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`Name`,`Surname`,`PhoneNum`);

--
-- Индексы таблицы `House`
--
ALTER TABLE `House`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`House`,`ID_Street`),
  ADD KEY `ID_Street` (`ID_Street`);

--
-- Индексы таблицы `Lekarstva`
--
ALTER TABLE `Lekarstva`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`Price`,`InceptDate`,`Quantity`,`ExpireDate`,`ID_Pharmancy`,`Name`),
  ADD KEY `ID_Pharmancy` (`ID_Pharmancy`);

--
-- Индексы таблицы `Street`
--
ALTER TABLE `Street`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`Street`,`ID_City`),
  ADD KEY `ID_City` (`ID_City`);

--
-- Индексы таблицы `Zakaz`
--
ALTER TABLE `Zakaz`
  ADD PRIMARY KEY (`ID`),
  ADD KEY `ID` (`ID`,`ID_Client`,`ID_Drug`,`OrderNumber`),
  ADD KEY `ID_Client` (`ID_Client`),
  ADD KEY `ID_Drug` (`ID_Drug`);

--
-- AUTO_INCREMENT для сохранённых таблиц
--

--
-- AUTO_INCREMENT для таблицы `Addres`
--
ALTER TABLE `Addres`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `Apteka`
--
ALTER TABLE `Apteka`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `Building`
--
ALTER TABLE `Building`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `City`
--
ALTER TABLE `City`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT для таблицы `Client`
--
ALTER TABLE `Client`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT для таблицы `House`
--
ALTER TABLE `House`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `Lekarstva`
--
ALTER TABLE `Lekarstva`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `Street`
--
ALTER TABLE `Street`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT для таблицы `Zakaz`
--
ALTER TABLE `Zakaz`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- Ограничения внешнего ключа сохраненных таблиц
--

--
-- Ограничения внешнего ключа таблицы `Addres`
--
ALTER TABLE `Addres`
  ADD CONSTRAINT `Addres_ibfk_4` FOREIGN KEY (`ID_City`) REFERENCES `City` (`ID`),
  ADD CONSTRAINT `Addres_ibfk_1` FOREIGN KEY (`ID_Street`) REFERENCES `Street` (`ID`),
  ADD CONSTRAINT `Addres_ibfk_2` FOREIGN KEY (`ID_House`) REFERENCES `House` (`ID`),
  ADD CONSTRAINT `Addres_ibfk_3` FOREIGN KEY (`ID_Building`) REFERENCES `Building` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Apteka`
--
ALTER TABLE `Apteka`
  ADD CONSTRAINT `Apteka_ibfk_1` FOREIGN KEY (`ID_Addres`) REFERENCES `Addres` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Building`
--
ALTER TABLE `Building`
  ADD CONSTRAINT `Building_ibfk_1` FOREIGN KEY (`ID_House`) REFERENCES `House` (`ID`);

--
-- Ограничения внешнего ключа таблицы `House`
--
ALTER TABLE `House`
  ADD CONSTRAINT `House_ibfk_1` FOREIGN KEY (`ID_Street`) REFERENCES `Street` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Lekarstva`
--
ALTER TABLE `Lekarstva`
  ADD CONSTRAINT `Lekarstva_ibfk_1` FOREIGN KEY (`ID_Pharmancy`) REFERENCES `Apteka` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Street`
--
ALTER TABLE `Street`
  ADD CONSTRAINT `Street_ibfk_1` FOREIGN KEY (`ID_City`) REFERENCES `City` (`ID`);

--
-- Ограничения внешнего ключа таблицы `Zakaz`
--
ALTER TABLE `Zakaz`
  ADD CONSTRAINT `Zakaz_ibfk_2` FOREIGN KEY (`ID_Drug`) REFERENCES `Lekarstva` (`ID`),
  ADD CONSTRAINT `Zakaz_ibfk_1` FOREIGN KEY (`ID_Client`) REFERENCES `Client` (`ID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
