SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

CREATE SCHEMA IF NOT EXISTS `optica` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci ;
USE `optica` ;

-- -----------------------------------------------------
-- Table `optica`.`client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`client` ;

CREATE TABLE IF NOT EXISTS `optica`.`client` (
  `Client_id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `Telefon` INT NOT NULL,
  `Email` VARCHAR(45) NOT NULL,
  `Data_Registre` DATE NOT NULL,
  `Recomanació_De` VARCHAR(45) NULL DEFAULT NULL,
  PRIMARY KEY (`Client_id`),
  UNIQUE INDEX `Client_id_UNIQUE` (`Client_id` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`empleats_optica`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`empleats_optica` ;

CREATE TABLE IF NOT EXISTS `optica`.`empleats_optica` (
  `Empleats Optica_id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Empleats Optica_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`proveidor`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`proveidor` ;

CREATE TABLE IF NOT EXISTS `optica`.`proveidor` (
  `Proveidor_ID` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Telefon` INT NOT NULL,
  `Fax` INT NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(10) NOT NULL,
  PRIMARY KEY (`Proveidor_ID`),
  UNIQUE INDEX `Client_ID_UNIQUE` (`Proveidor_ID` ASC, `Nom` ASC) VISIBLE,
  UNIQUE INDEX `Proveidor_ID_UNIQUE` (`Proveidor_ID` ASC) VISIBLE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`marca`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`marca` ;

CREATE TABLE IF NOT EXISTS `optica`.`marca` (
  `Marca_ID` INT NOT NULL AUTO_INCREMENT,
  `Nombre_Marca` VARCHAR(30) NOT NULL,
  `Proveidor_Proveidor_ID` INT NOT NULL,
  PRIMARY KEY (`Marca_ID`, `Nombre_Marca`),
  UNIQUE INDEX `Marca_ID_UNIQUE` (`Marca_ID` ASC) VISIBLE,
  INDEX (`Proveidor_Proveidor_ID` ASC) VISIBLE,
  CONSTRAINT `fk_Marcas_Proveidor1`
    FOREIGN KEY (`Proveidor_Proveidor_ID`)
    REFERENCES `optica`.`proveidor` (`Proveidor_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`ulleres`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`ulleres` ;

CREATE TABLE IF NOT EXISTS `optica`.`ulleres` (
  `Ulleres_id` INT NOT NULL AUTO_INCREMENT,
  `Graduació_RH` VARCHAR(5) NOT NULL COMMENT 'Graduació vidre dret',
  `Graduació_LH` VARCHAR(5) NOT NULL COMMENT 'Graduación vidre esquerra',
  `Muntura` ENUM('Montant', 'Pasta', 'Metàl.lica') NOT NULL COMMENT '1 = Montant, 2=Pasta, 3 =Metàl.lica',
  `Color_Muntura` VARCHAR(45) NOT NULL,
  `Color_vidre` VARCHAR(45) NOT NULL,
  `Preu` INT NOT NULL,
  `Marcas_Marcas_ID` INT NOT NULL,
  PRIMARY KEY (`Ulleres_id`),
  INDEX `fk_Glasses_Marcas1_idx` (`Marcas_Marcas_ID` ASC) INVISIBLE,
  CONSTRAINT `fk_Glasses_Marcas1`
    FOREIGN KEY (`Marcas_Marcas_ID`)
    REFERENCES `optica`.`marca` (`Marca_ID`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


-- -----------------------------------------------------
-- Table `optica`.`gafasvendidas`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `optica`.`gafasvendidas` ;

CREATE TABLE IF NOT EXISTS `optica`.`gafasvendidas` (
  `GafasVendidas_Id` INT NOT NULL AUTO_INCREMENT,
  `Fecha` TIMESTAMP(6) NOT NULL,
  `Client_Client_id` INT NOT NULL,
  `Empleats Optica_Empleats Optica_id` INT NOT NULL,
  `Ulleres_Ulleres_id` INT NOT NULL,
  PRIMARY KEY (`GafasVendidas_Id`),
  UNIQUE INDEX `GafasVendidas_Id_UNIQUE` (`GafasVendidas_Id` ASC) VISIBLE,
  INDEX (`Client_Client_id` ASC) INVISIBLE,
  INDEX (`Empleats Optica_Empleats Optica_id` ASC) VISIBLE,
  INDEX (`Ulleres_Ulleres_id` ASC) VISIBLE,
  CONSTRAINT `fk_Ventas_Client1`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `optica`.`client` (`Client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ventas_Empleats Optica1`
    FOREIGN KEY (`Empleats Optica_Empleats Optica_id`)
    REFERENCES `optica`.`empleats_optica` (`Empleats Optica_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Ventas_Ulleres1`
    FOREIGN KEY (`Ulleres_Ulleres_id`)
    REFERENCES `optica`.`ulleres` (`Ulleres_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8mb4
COLLATE = utf8mb4_0900_ai_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `optica`.`client`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`client` (`Client_id`, `Nom`, `Adreça`, `Telefon`, `Email`, `Data_Registre`, `Recomanació_De`) VALUES (1, 'JORDI', 'Carrer Rosello 453', 655239856, 'jordi@gmail.com', '2021-01-01', 'null');
INSERT INTO `optica`.`client` (`Client_id`, `Nom`, `Adreça`, `Telefon`, `Email`, `Data_Registre`, `Recomanació_De`) VALUES (2, 'JOAN', 'Carrer Rosello 85', 656249757, 'joan@gmail.com', '2021-02-02', '1');
INSERT INTO `optica`.`client` (`Client_id`, `Nom`, `Adreça`, `Telefon`, `Email`, `Data_Registre`, `Recomanació_De`) VALUES (3, 'CARLES', 'Carrer Corsega 53', 600695321, 'carles@gmail.com', '2021-02-02', '1');

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`empleats_optica`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`empleats_optica` (`Empleats Optica_id`, `Nom`, `Cognoms`) VALUES (1, 'Laura', 'Lopez');
INSERT INTO `optica`.`empleats_optica` (`Empleats Optica_id`, `Nom`, `Cognoms`) VALUES (2, 'Pedro', 'Carreño');
INSERT INTO `optica`.`empleats_optica` (`Empleats Optica_id`, `Nom`, `Cognoms`) VALUES (3, 'Iu', 'Garcia');

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`proveidor`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`proveidor` (`Proveidor_ID`, `Nom`, `Telefon`, `Fax`, `Adreça`, `NIF`) VALUES (1, 'Coolglasses', 654852363, 654852364, 'Carrer Rosello 43', '22589632');
INSERT INTO `optica`.`proveidor` (`Proveidor_ID`, `Nom`, `Telefon`, `Fax`, `Adreça`, `NIF`) VALUES (2, 'Ulleres', 641789565, 641789566, 'Carrer Perill 22', '36389634');

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`marca`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`marca` (`Marca_ID`, `Nombre_Marca`, `Proveidor_Proveidor_ID`) VALUES (DEFAULT, 'GG', 1);
INSERT INTO `optica`.`marca` (`Marca_ID`, `Nombre_Marca`, `Proveidor_Proveidor_ID`) VALUES (DEFAULT, 'Natural sight', 2);
INSERT INTO `optica`.`marca` (`Marca_ID`, `Nombre_Marca`, `Proveidor_Proveidor_ID`) VALUES (DEFAULT, 'Prett Glasses', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`ulleres`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`ulleres` (`Ulleres_id`, `Graduació_RH`, `Graduació_LH`, `Muntura`, `Color_Muntura`, `Color_vidre`, `Preu`, `Marcas_Marcas_ID`) VALUES (DEFAULT, '2', '1', '2', 'blau', 'negre', 59, 1);
INSERT INTO `optica`.`ulleres` (`Ulleres_id`, `Graduació_RH`, `Graduació_LH`, `Muntura`, `Color_Muntura`, `Color_vidre`, `Preu`, `Marcas_Marcas_ID`) VALUES (DEFAULT, '1', '1', '2', 'verd', 'negre', 129, 3);
INSERT INTO `optica`.`ulleres` (`Ulleres_id`, `Graduació_RH`, `Graduació_LH`, `Muntura`, `Color_Muntura`, `Color_vidre`, `Preu`, `Marcas_Marcas_ID`) VALUES (DEFAULT, '3', '1', '3', 'verd', 'negre', 149, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `optica`.`gafasvendidas`
-- -----------------------------------------------------
START TRANSACTION;
USE `optica`;
INSERT INTO `optica`.`gafasvendidas` (`GafasVendidas_Id`, `Fecha`, `Client_Client_id`, `Empleats Optica_Empleats Optica_id`, `Ulleres_Ulleres_id`) VALUES (DEFAULT, '2021-01-01', 1, 1, 1);
INSERT INTO `optica`.`gafasvendidas` (`GafasVendidas_Id`, `Fecha`, `Client_Client_id`, `Empleats Optica_Empleats Optica_id`, `Ulleres_Ulleres_id`) VALUES (DEFAULT, '2021-02-02', 2, 3, 2);
INSERT INTO `optica`.`gafasvendidas` (`GafasVendidas_Id`, `Fecha`, `Client_Client_id`, `Empleats Optica_Empleats Optica_id`, `Ulleres_Ulleres_id`) VALUES (DEFAULT, '2021-02-02', 3, 3, 3);

COMMIT;