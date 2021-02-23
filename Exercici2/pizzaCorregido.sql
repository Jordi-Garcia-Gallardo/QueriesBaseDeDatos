SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `mydb` ;

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`Provincia`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Provincia` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Provincia` (
  `Provincia_id` INT NOT NULL AUTO_INCREMENT,
  `NomProvincia` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Provincia_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Localitat`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Localitat` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Localitat` (
  `Localitat_id` INT NOT NULL AUTO_INCREMENT,
  `NomLocalitat` VARCHAR(45) NOT NULL,
  `Provincia_Provincia_id` INT NOT NULL,
  PRIMARY KEY (`Localitat_id`, `Provincia_Provincia_id`),
  INDEX `fk_Localitat_Provincia_idx` (`Provincia_Provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_Localitat_Provincia`
    FOREIGN KEY (`Provincia_Provincia_id`)
    REFERENCES `mydb`.`Provincia` (`Provincia_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Client` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `Client_id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `Adreça` VARCHAR(45) NOT NULL,
  `CP` INT NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Localitat_Localitat_id` INT NOT NULL,
  `Localitat_Provincia_Provincia_id` INT NOT NULL,
  PRIMARY KEY (`Client_id`, `Localitat_Localitat_id`, `Localitat_Provincia_Provincia_id`),
  INDEX `fk_Client_Localitat1_idx` (`Localitat_Localitat_id` ASC, `Localitat_Provincia_Provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_Client_Localitat1`
    FOREIGN KEY (`Localitat_Localitat_id` , `Localitat_Provincia_Provincia_id`)
    REFERENCES `mydb`.`Localitat` (`Localitat_id` , `Provincia_Provincia_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Botiga`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Botiga` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Botiga` (
  `Botiga_id` INT NOT NULL AUTO_INCREMENT,
  `Adreça` VARCHAR(45) NOT NULL,
  `CP` INT NOT NULL,
  `Localitat_Localitat_id` INT NOT NULL,
  `Localitat_Provincia_Provincia_id` INT NOT NULL,
  PRIMARY KEY (`Botiga_id`, `Localitat_Localitat_id`, `Localitat_Provincia_Provincia_id`),
  INDEX `fk_Botiga_Localitat1_idx` (`Localitat_Localitat_id` ASC, `Localitat_Provincia_Provincia_id` ASC) VISIBLE,
  CONSTRAINT `fk_Botiga_Localitat1`
    FOREIGN KEY (`Localitat_Localitat_id` , `Localitat_Provincia_Provincia_id`)
    REFERENCES `mydb`.`Localitat` (`Localitat_id` , `Provincia_Provincia_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Empleats`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Empleats` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Empleats` (
  `Empleats_id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Cognoms` VARCHAR(45) NOT NULL,
  `NIF` VARCHAR(45) NOT NULL,
  `Telefon` VARCHAR(45) NOT NULL,
  `Funció` ENUM('C', 'R') NOT NULL COMMENT 'C = CUINER\nR = REPARTIDOR',
  `Botiga_Botiga_id` INT NOT NULL,
  PRIMARY KEY (`Empleats_id`, `Botiga_Botiga_id`),
  INDEX `fk_Empleats_Botiga1_idx` (`Botiga_Botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_Empleats_Botiga1`
    FOREIGN KEY (`Botiga_Botiga_id`)
    REFERENCES `mydb`.`Botiga` (`Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Comanda`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Comanda` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Comanda` (
  `Comanda_id` INT NOT NULL AUTO_INCREMENT,
  `Client_Client_id` INT NOT NULL,
  `Data/hora` DATETIME(6) NOT NULL,
  `TipusComanda` ENUM('R', 'L') NOT NULL COMMENT 'R= REPARTIMENT\nL= LOCAL',
  `Quantitat Pizzes` INT NOT NULL,
  `Quantitat Hamburgueses` INT NOT NULL,
  `Quantitat Begudes` INT NOT NULL,
  `Preu` VARCHAR(45) NOT NULL,
  `Empleats_Empleats_id` INT NULL,
  `Data/hora Lliurament` DATETIME(6) NULL,
  `Botiga_Botiga_id` INT NOT NULL,
  PRIMARY KEY (`Comanda_id`, `Client_Client_id`, `Botiga_Botiga_id`),
  INDEX `fk_Comanda_Client1_idx` (`Client_Client_id` ASC) VISIBLE,
  INDEX `fk_Comanda_Empleats1_idx` (`Empleats_Empleats_id` ASC) VISIBLE,
  INDEX `fk_Comanda_Botiga1_idx` (`Botiga_Botiga_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comanda_Client1`
    FOREIGN KEY (`Client_Client_id`)
    REFERENCES `mydb`.`Client` (`Client_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda_Empleats1`
    FOREIGN KEY (`Empleats_Empleats_id`)
    REFERENCES `mydb`.`Empleats` (`Empleats_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comanda_Botiga1`
    FOREIGN KEY (`Botiga_Botiga_id`)
    REFERENCES `mydb`.`Botiga` (`Botiga_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Categoria Pizzes`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Categoria Pizzes` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Categoria Pizzes` (
  `Categoria Pizzes_id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Categoria Pizzes_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Producto`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Producto` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Producto` (
  `Producto_id` INT NOT NULL AUTO_INCREMENT,
  `Nom` VARCHAR(45) NOT NULL,
  `Descripció` VARCHAR(90) NOT NULL,
  `imatge` BLOB NULL,
  `Preu` VARCHAR(45) NOT NULL,
  `Tipo_producto` ENUM('P', 'B', 'H') NOT NULL COMMENT 'P = Pizza\nB = Bebida\nH = Hamburguesa',
  `Categoria Pizzes_Categoria Pizzes_id` INT NULL,
  PRIMARY KEY (`Producto_id`),
  INDEX `fk_Producto_Categoria Pizzes1_idx` (`Categoria Pizzes_Categoria Pizzes_id` ASC) VISIBLE,
  CONSTRAINT `fk_Producto_Categoria Pizzes1`
    FOREIGN KEY (`Categoria Pizzes_Categoria Pizzes_id`)
    REFERENCES `mydb`.`Categoria Pizzes` (`Categoria Pizzes_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Detalle Comanda/Producto.`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `mydb`.`Detalle Comanda/Producto.` ;

CREATE TABLE IF NOT EXISTS `mydb`.`Detalle Comanda/Producto.` (
  `Detalle Producto. Comanda_ID` INT NOT NULL AUTO_INCREMENT,
  `Comanda_Comanda_id` INT NOT NULL,
  `Producto_Producto_id` INT NOT NULL,
  PRIMARY KEY (`Detalle Producto. Comanda_ID`),
  INDEX `fk_Detalle Hamb. Comanda_Comanda1_idx` (`Comanda_Comanda_id` ASC) VISIBLE,
  INDEX `fk_Detalle Hamb. Comanda_Producto1_idx` (`Producto_Producto_id` ASC) VISIBLE,
  CONSTRAINT `fk_Detalle Hamb. Comanda_Comanda1`
    FOREIGN KEY (`Comanda_Comanda_id`)
    REFERENCES `mydb`.`Comanda` (`Comanda_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Detalle Hamb. Comanda_Producto1`
    FOREIGN KEY (`Producto_Producto_id`)
    REFERENCES `mydb`.`Producto` (`Producto_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `mydb`.`Provincia`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Provincia` (`Provincia_id`, `NomProvincia`) VALUES (1, 'Barcelona');
INSERT INTO `mydb`.`Provincia` (`Provincia_id`, `NomProvincia`) VALUES (DEFAULT, 'Girona');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Localitat`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Localitat` (`Localitat_id`, `NomLocalitat`, `Provincia_Provincia_id`) VALUES (1, 'Badalona', 1);
INSERT INTO `mydb`.`Localitat` (`Localitat_id`, `NomLocalitat`, `Provincia_Provincia_id`) VALUES (DEFAULT, 'Banyoles', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Client`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Client` (`Client_id`, `Nom`, `Cognoms`, `Adreça`, `CP`, `Telefon`, `Localitat_Localitat_id`, `Localitat_Provincia_Provincia_id`) VALUES (1, 'Joan', 'Lopez', 'Lopez', 08023, '654236963', 1, 1);
INSERT INTO `mydb`.`Client` (`Client_id`, `Nom`, `Cognoms`, `Adreça`, `CP`, `Telefon`, `Localitat_Localitat_id`, `Localitat_Provincia_Provincia_id`) VALUES (2, 'Joan', 'Perez', 'Carreño', 09563, '632569452', 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Botiga`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Botiga` (`Botiga_id`, `Adreça`, `CP`, `Localitat_Localitat_id`, `Localitat_Provincia_Provincia_id`) VALUES (1, 'Carrer Bonanova 53', 08035, 1, 1);
INSERT INTO `mydb`.`Botiga` (`Botiga_id`, `Adreça`, `CP`, `Localitat_Localitat_id`, `Localitat_Provincia_Provincia_id`) VALUES (2, 'Carrer Sabadell 23', 09653, 2, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Empleats`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Empleats` (`Empleats_id`, `Nom`, `Cognoms`, `NIF`, `Telefon`, `Funció`, `Botiga_Botiga_id`) VALUES (1, 'Joel ', 'Sabater Garcia', '46598789Q', '652363212', 'C', 1);
INSERT INTO `mydb`.`Empleats` (`Empleats_id`, `Nom`, `Cognoms`, `NIF`, `Telefon`, `Funció`, `Botiga_Botiga_id`) VALUES (2, 'Raquel', 'Quiros Hang', '48598789A', '689457632', 'R', 1);
INSERT INTO `mydb`.`Empleats` (`Empleats_id`, `Nom`, `Cognoms`, `NIF`, `Telefon`, `Funció`, `Botiga_Botiga_id`) VALUES (3, 'Johan', 'Lopez Perez', '42298711B', '612356952', 'C', 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Comanda`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Comanda` (`Comanda_id`, `Client_Client_id`, `Data/hora`, `TipusComanda`, `Quantitat Pizzes`, `Quantitat Hamburgueses`, `Quantitat Begudes`, `Preu`, `Empleats_Empleats_id`, `Data/hora Lliurament`, `Botiga_Botiga_id`) VALUES (1, 1, '2021-01-01', 'R', 2, 2, 3, '53', 2, '2021-01-01/22:03', 1);
INSERT INTO `mydb`.`Comanda` (`Comanda_id`, `Client_Client_id`, `Data/hora`, `TipusComanda`, `Quantitat Pizzes`, `Quantitat Hamburgueses`, `Quantitat Begudes`, `Preu`, `Empleats_Empleats_id`, `Data/hora Lliurament`, `Botiga_Botiga_id`) VALUES (2, 2, '2021-01-05', 'L', 1, 1, 2, '23', NULL, NULL, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Categoria Pizzes`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Categoria Pizzes` (`Categoria Pizzes_id`, `Nom`) VALUES (DEFAULT, 'Basic');
INSERT INTO `mydb`.`Categoria Pizzes` (`Categoria Pizzes_id`, `Nom`) VALUES (DEFAULT, 'Gourmet');
INSERT INTO `mydb`.`Categoria Pizzes` (`Categoria Pizzes_id`, `Nom`) VALUES (DEFAULT, 'Estacional');

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Producto`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (1, 'H.Queso', 'Hamb. y Queso', NULL, '8', 'H', NULL);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (2, 'H.Completa', 'Hamb. y Queso cebolla huevo', NULL, '10', 'H', NULL);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (3, 'Cerveza', 'Moritz 33cl', NULL, '2.5', 'B', NULL);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (4, 'Aigua', 'Viladrau 33cl', NULL, '2', 'B', NULL);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (5, 'Coca-Cola', 'Lata 25cl', NULL, '2.2', 'B', NULL);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (6, 'Coca-Cola', 'Botella 33cl', NULL, '2.5', 'B', NULL);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (7, 'P. 4 Quesos', 'Tomate, Mozzarella,gorgonzola,parmesano,queso de cabra', NULL, '9', 'P', 1);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (8, 'P.Trufada', 'Tomate, Mozzarella, queso pecorino y trufa', NULL, '15', 'P', 2);
INSERT INTO `mydb`.`Producto` (`Producto_id`, `Nom`, `Descripció`, `imatge`, `Preu`, `Tipo_producto`, `Categoria Pizzes_Categoria Pizzes_id`) VALUES (9, 'P. Calçots', 'Tomate, Mozzarella, Calçots, Romesco', NULL, '12', 'P', 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `mydb`.`Detalle Comanda/Producto.`
-- -----------------------------------------------------
START TRANSACTION;
USE `mydb`;
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (1, 1, 7);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (2, 1, 8);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (3, 1, 1);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (4, 1, 2);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (5, 1, 3);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (6, 1, 3);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (7, 1, 5);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (8, 2, 9);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (9, 2, 1);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (10, 2, 3);
INSERT INTO `mydb`.`Detalle Comanda/Producto.` (`Detalle Producto. Comanda_ID`, `Comanda_Comanda_id`, `Producto_Producto_id`) VALUES (11, 2, 6);

COMMIT;