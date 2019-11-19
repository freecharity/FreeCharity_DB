-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema free_charity
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `free_charity` ;

-- -----------------------------------------------------
-- Schema free_charity
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `free_charity` DEFAULT CHARACTER SET utf8 COLLATE utf8_general_ci;
USE `free_charity` ;

-- -----------------------------------------------------
-- Table `free_charity`.`category`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `free_charity`.`category` (
  `category_id` INT(11) NOT NULL AUTO_INCREMENT,
  `name` VARCHAR(45) NOT NULL,
  `group` VARCHAR(45) NOT NULL,
  `description` VARCHAR(255) NOT NULL,
  `image` VARCHAR(45) NOT NULL,
  `deleted` TINYINT NOT NULL,
  PRIMARY KEY (`category_id`),
  UNIQUE INDEX `name_UNIQUE` (`name` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `free_charity`.`question`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `free_charity`.`question` (
  `question_id` INT(11) NOT NULL AUTO_INCREMENT,
  `question` VARCHAR(255) NOT NULL,
  `answer` VARCHAR(100) NOT NULL,
  `incorrect_1` VARCHAR(100) NOT NULL,
  `incorrect_2` VARCHAR(100) NOT NULL,
  `incorrect_3` VARCHAR(100) NOT NULL,
  `deleted` TINYINT NOT NULL,
  `category_id` INT(11) NOT NULL,
  PRIMARY KEY (`question_id`),
  INDEX `fk_question_category_idx` (`category_id` ASC),
  UNIQUE INDEX `question_UNIQUE` (`question` ASC),
  CONSTRAINT `fk_question_category`
    FOREIGN KEY (`category_id`)
    REFERENCES `free_charity`.`category` (`category_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `free_charity`.`user`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `free_charity`.`user` (
  `user_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `email` VARCHAR(100) NOT NULL,
  `password` VARCHAR(45) NOT NULL,
  `avatar` VARCHAR(45) NOT NULL,
  `deleted` TINYINT NOT NULL,
  `date_registered` DATETIME NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE INDEX `username_UNIQUE` (`username` ASC),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `free_charity`.`answer`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `free_charity`.`answer` (
  `answer_id` INT(11) NOT NULL AUTO_INCREMENT,
  `answer` VARCHAR(100) NOT NULL,
  `correct` TINYINT(4) NOT NULL,
  `ip` VARCHAR(45) NOT NULL,
  `date_answered` DATETIME NOT NULL,
  `deleted` TINYINT(4) NOT NULL,
  `question_id` INT(11) NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`answer_id`),
  INDEX `fk_answer_question1_idx` (`question_id` ASC),
  INDEX `fk_answer_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_answer_question1`
    FOREIGN KEY (`question_id`)
    REFERENCES `free_charity`.`question` (`question_id`),
  CONSTRAINT `fk_answer_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `free_charity`.`user` (`user_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


-- -----------------------------------------------------
-- Table `free_charity`.`donation`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `free_charity`.`donation` (
  `donation_id` INT(11) NOT NULL AUTO_INCREMENT,
  `username` VARCHAR(45) NOT NULL,
  `amount` DOUBLE NOT NULL,
  `datetime` DATETIME NOT NULL,
  `user_id` INT(11) NOT NULL,
  PRIMARY KEY (`donation_id`),
  INDEX `fk_donation_user1_idx` (`user_id` ASC),
  CONSTRAINT `fk_donation_user1`
    FOREIGN KEY (`user_id`)
    REFERENCES `free_charity`.`user` (`user_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;