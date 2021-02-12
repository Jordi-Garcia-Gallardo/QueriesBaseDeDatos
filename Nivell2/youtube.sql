-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema youtube
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `youtube` DEFAULT CHARACTER SET utf8 ;
USE `youtube` ;

-- -----------------------------------------------------
-- Table `youtube`.`Users`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`Users` ;

CREATE TABLE IF NOT EXISTS `youtube`.`Users` (
  `Users_id` INT NOT NULL AUTO_INCREMENT,
  `email` VARCHAR(45) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `nom_usuari` VARCHAR(45) NOT NULL,
  `birthdate` DATE NOT NULL,
  `sex` ENUM('M', 'F') NOT NULL COMMENT 'M = Male , F = Female',
  `country` VARCHAR(45) NOT NULL,
  `Postal_Code` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`Users_id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`Playlist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`Playlist` ;

CREATE TABLE IF NOT EXISTS `youtube`.`Playlist` (
  `Playlist_id` INT NOT NULL AUTO_INCREMENT,
  `Playlist_Name` VARCHAR(45) NOT NULL,
  `Date` DATE NOT NULL,
  `State` ENUM('Public', 'Private') NOT NULL,
  `Users_Users_id` INT NOT NULL,
  PRIMARY KEY (`Playlist_id`, `Users_Users_id`),
  INDEX `fk_Playlist_Users1_idx` (`Users_Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Playlist_Users1`
    FOREIGN KEY (`Users_Users_id`)
    REFERENCES `youtube`.`Users` (`Users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`Canal`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`Canal` ;

CREATE TABLE IF NOT EXISTS `youtube`.`Canal` (
  `Canal_id` INT NOT NULL AUTO_INCREMENT,
  `Users_Users_id` INT NOT NULL,
  `Name` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Creation_Date` DATE NOT NULL,
  PRIMARY KEY (`Canal_id`, `Users_Users_id`),
  UNIQUE INDEX `Canal_id_UNIQUE` (`Canal_id` ASC) VISIBLE,
  INDEX `fk_Canal_Users1_idx` (`Users_Users_id` ASC) VISIBLE,
  UNIQUE INDEX `Users_Users_id_UNIQUE` (`Users_Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Canal_Users1`
    FOREIGN KEY (`Users_Users_id`)
    REFERENCES `youtube`.`Users` (`Users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`video`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`video` ;

CREATE TABLE IF NOT EXISTS `youtube`.`video` (
  `video_id` INT NOT NULL AUTO_INCREMENT,
  `title` VARCHAR(45) NOT NULL,
  `Description` VARCHAR(45) NOT NULL,
  `Dimensions` VARCHAR(60) NOT NULL,
  `name` VARCHAR(45) NOT NULL,
  `Duration` TIME NOT NULL,
  `Thumbnail` BLOB NULL,
  `Num_reproductions` INT NOT NULL,
  `Num_likes` INT NOT NULL,
  `Num_Dislikes` INT NOT NULL,
  `State` ENUM('Hiden', 'Public', 'Private') NOT NULL,
  `Creation_DateTime` DATETIME(6) NOT NULL,
  `Users_Users_id` INT NOT NULL COMMENT 'Creator',
  `Playlist_Playlist_id` INT NULL,
  `Canal_Canal_id` INT NULL,
  PRIMARY KEY (`video_id`, `Users_Users_id`),
  INDEX `fk_video_Users1_idx` (`Users_Users_id` ASC) VISIBLE,
  INDEX `fk_video_Playlist1_idx` (`Playlist_Playlist_id` ASC) VISIBLE,
  INDEX `fk_video_Canal1_idx` (`Canal_Canal_id` ASC) VISIBLE,
  CONSTRAINT `fk_video_Users1`
    FOREIGN KEY (`Users_Users_id`)
    REFERENCES `youtube`.`Users` (`Users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_Playlist1`
    FOREIGN KEY (`Playlist_Playlist_id`)
    REFERENCES `youtube`.`Playlist` (`Playlist_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_video_Canal1`
    FOREIGN KEY (`Canal_Canal_id`)
    REFERENCES `youtube`.`Canal` (`Canal_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`tags`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`tags` ;

CREATE TABLE IF NOT EXISTS `youtube`.`tags` (
  `tags_id` INT NOT NULL AUTO_INCREMENT,
  `TagName` VARCHAR(45) NOT NULL,
  `video_video_id` INT NOT NULL,
  PRIMARY KEY (`tags_id`, `video_video_id`),
  INDEX `fk_tags_video1_idx` (`video_video_id` ASC) VISIBLE,
  CONSTRAINT `fk_tags_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`Video_Valoration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`Video_Valoration` ;

CREATE TABLE IF NOT EXISTS `youtube`.`Video_Valoration` (
  `Valoration_id` INT NOT NULL AUTO_INCREMENT,
  `Like_Dislike` ENUM('Like', 'Dislike') NOT NULL,
  `Valoration_Date` DATETIME(6) NOT NULL,
  `video_video_id` INT NOT NULL,
  `Users_Users_id` INT NOT NULL,
  PRIMARY KEY (`Valoration_id`, `video_video_id`, `Users_Users_id`),
  INDEX `fk_Video_Valoration_video1_idx` (`video_video_id` ASC) VISIBLE,
  INDEX `fk_Video_Valoration_Users1_idx` (`Users_Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Video_Valoration_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Video_Valoration_Users1`
    FOREIGN KEY (`Users_Users_id`)
    REFERENCES `youtube`.`Users` (`Users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`Comments`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`Comments` ;

CREATE TABLE IF NOT EXISTS `youtube`.`Comments` (
  `Comments_id` INT NOT NULL AUTO_INCREMENT,
  `text` VARCHAR(90) NOT NULL,
  `DateTime` DATETIME(6) NOT NULL,
  `video_video_id` INT NOT NULL,
  `Users_Users_id` INT NOT NULL,
  PRIMARY KEY (`Comments_id`),
  INDEX `fk_Comments_video1_idx` (`video_video_id` ASC) VISIBLE,
  INDEX `fk_Comments_Users1_idx` (`Users_Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comments_video1`
    FOREIGN KEY (`video_video_id`)
    REFERENCES `youtube`.`video` (`video_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comments_Users1`
    FOREIGN KEY (`Users_Users_id`)
    REFERENCES `youtube`.`Users` (`Users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `youtube`.`Comment_Valoration`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `youtube`.`Comment_Valoration` ;

CREATE TABLE IF NOT EXISTS `youtube`.`Comment_Valoration` (
  `Comment_Valoration_id` INT NOT NULL AUTO_INCREMENT,
  `Comment_Like/Dislike` ENUM('Like', 'Dislike') NOT NULL,
  `Date/Time` DATETIME(6) NOT NULL,
  `Comments_Comments_id` INT NOT NULL,
  `Users_Users_id` INT NOT NULL,
  PRIMARY KEY (`Comment_Valoration_id`, `Comments_Comments_id`, `Users_Users_id`),
  INDEX `fk_Comment_Valoration_Comments1_idx` (`Comments_Comments_id` ASC) VISIBLE,
  INDEX `fk_Comment_Valoration_Users1_idx` (`Users_Users_id` ASC) VISIBLE,
  CONSTRAINT `fk_Comment_Valoration_Comments1`
    FOREIGN KEY (`Comments_Comments_id`)
    REFERENCES `youtube`.`Comments` (`Comments_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_Comment_Valoration_Users1`
    FOREIGN KEY (`Users_Users_id`)
    REFERENCES `youtube`.`Users` (`Users_id`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;

-- -----------------------------------------------------
-- Data for table `youtube`.`Users`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`Users` (`Users_id`, `email`, `password`, `nom_usuari`, `birthdate`, `sex`, `country`, `Postal_Code`) VALUES (1, 'jordi@gmail.com', '1234', 'jordi22', '1988-02-02', 'm', 'Spain', '08012');
INSERT INTO `youtube`.`Users` (`Users_id`, `email`, `password`, `nom_usuari`, `birthdate`, `sex`, `country`, `Postal_Code`) VALUES (2, 'joan@gmail.com', '5678', 'jonny', '1985-02-010', 'm', 'Spain', '08039');
INSERT INTO `youtube`.`Users` (`Users_id`, `email`, `password`, `nom_usuari`, `birthdate`, `sex`, `country`, `Postal_Code`) VALUES (3, 'carlos@gmail.com', '1357', 'carlos', '2000-05-10', 'm', 'Spain', '08001');

COMMIT;


-- -----------------------------------------------------
-- Data for table `youtube`.`Playlist`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`Playlist` (`Playlist_id`, `Playlist_Name`, `Date`, `State`, `Users_Users_id`) VALUES (1, 'jajas', '2021-01-02', 'public', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `youtube`.`Canal`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`Canal` (`Canal_id`, `Users_Users_id`, `Name`, `Description`, `Creation_Date`) VALUES (1, 1, 'animales', 'funny videos', '2020-01-01');

COMMIT;


-- -----------------------------------------------------
-- Data for table `youtube`.`video`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`video` (`video_id`, `title`, `Description`, `Dimensions`, `name`, `Duration`, `Thumbnail`, `Num_reproductions`, `Num_likes`, `Num_Dislikes`, `State`, `Creation_DateTime`, `Users_Users_id`, `Playlist_Playlist_id`, `Canal_Canal_id`) VALUES (1, 'cats', 'funny video of animals', '1080x720', 'fcat', '01:23', NULL, 5, 2, 0, 'Public', '2020-01-01/00:20', 1, 1, 1);
INSERT INTO `youtube`.`video` (`video_id`, `title`, `Description`, `Dimensions`, `name`, `Duration`, `Thumbnail`, `Num_reproductions`, `Num_likes`, `Num_Dislikes`, `State`, `Creation_DateTime`, `Users_Users_id`, `Playlist_Playlist_id`, `Canal_Canal_id`) VALUES (2, 'catsplay', 'funny video of cats', '1080x720', 'fcat2', '05:23', NULL, 23, 2, 0, 'Public', '2020-01-01/03:10', 1, 1, 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `youtube`.`tags`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`tags` (`tags_id`, `TagName`, `video_video_id`) VALUES (1, 'LOL', 1);

COMMIT;


-- -----------------------------------------------------
-- Data for table `youtube`.`Video_Valoration`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`Video_Valoration` (`Valoration_id`, `Like_Dislike`, `Valoration_Date`, `video_video_id`, `Users_Users_id`) VALUES (2, 'like', '2021-01-01', 1, 2);
INSERT INTO `youtube`.`Video_Valoration` (`Valoration_id`, `Like_Dislike`, `Valoration_Date`, `video_video_id`, `Users_Users_id`) VALUES (1, 'like', '2021-01-01', 2, 2);
INSERT INTO `youtube`.`Video_Valoration` (`Valoration_id`, `Like_Dislike`, `Valoration_Date`, `video_video_id`, `Users_Users_id`) VALUES (3, 'like', '2021-02-06', 2, 3);
INSERT INTO `youtube`.`Video_Valoration` (`Valoration_id`, `Like_Dislike`, `Valoration_Date`, `video_video_id`, `Users_Users_id`) VALUES (4, 'like', '2021-02-06', 1, 3);

COMMIT;


-- -----------------------------------------------------
-- Data for table `youtube`.`Comments`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`Comments` (`Comments_id`, `text`, `DateTime`, `video_video_id`, `Users_Users_id`) VALUES (1, 'MUY DIVERTIDO', '2121-02-02', 1, 2);

COMMIT;


-- -----------------------------------------------------
-- Data for table `youtube`.`Comment_Valoration`
-- -----------------------------------------------------
START TRANSACTION;
USE `youtube`;
INSERT INTO `youtube`.`Comment_Valoration` (`Comment_Valoration_id`, `Comment_Like/Dislike`, `Date/Time`, `Comments_Comments_id`, `Users_Users_id`) VALUES (1, 'LIKE', '2021-02-11', 1, 3);

COMMIT;
