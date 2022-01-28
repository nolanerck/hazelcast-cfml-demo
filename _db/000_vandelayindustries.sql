CREATE DATABASE IF NOT EXISTS vandelayindustries;
USE vandelayindustries;

--
-- Table structures
--

DROP TABLE IF EXISTS `tCustomers`;
CREATE TABLE `tCustomers` (
  `CustomerPK` int(11) NOT NULL,
  `FirstName` VARCHAR(50) DEFAULT NULL,
  `LastName` VARCHAR(50) DEFAULT NULL,
  PRIMARY KEY (`CustomerPK`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

INSERT INTO tCustomers( FirstName, LastName ) VALUES( 'John', 'Lennon' )
