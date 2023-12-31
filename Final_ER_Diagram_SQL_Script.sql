-- MySQL Script generated by MySQL Workbench
-- Tue Apr 12 15:38:04 2022
-- Model: New Model    Version: 1.0
-- MySQL Workbench Forward Engineering

SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------

-- -----------------------------------------------------
-- Schema mydb
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `mydb` DEFAULT CHARACTER SET utf8 ;
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`District`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`District` (
  `districtID` VARCHAR(10) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `phoneNo` INT NULL,
  PRIMARY KEY (`districtID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Prosecutor`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Prosecutor` (
  `prosecutorID` VARCHAR(5) NOT NULL,
  `barNo` INT NULL,
  `fName` VARCHAR(15) NULL,
  `lName` VARCHAR(15) NULL,
  `phoneNo` INT NULL,
  `districtID` VARCHAR(15) NOT NULL,
  PRIMARY KEY (`prosecutorID`),
  INDEX `districtID_idx` (`districtID` ASC) VISIBLE,
  CONSTRAINT `districtID`
    FOREIGN KEY (`districtID`)
    REFERENCES `mydb`.`District` (`districtID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff_All`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff_All` (
  `staffID` INT NOT NULL,
  `fName` VARCHAR(20) NULL,
  `lName` VARCHAR(20) NULL,
  `DOB` DATE NULL,
  `districtID` VARCHAR(10) NULL,
  `phoneNo` INT NULL,
  `Position` VARCHAR(20) NULL,
  `Salary` VARCHAR(20) NULL,
  PRIMARY KEY (`staffID`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff, Attorney`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff, Attorney` (
  `barNo` INT NOT NULL,
  `staffID` INT NOT NULL,
  `districtID` VARCHAR(10) NOT NULL,
  `caseNo` INT NOT NULL,
  PRIMARY KEY (`barNo`),
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  INDEX `districtID_idx` (`districtID` ASC) VISIBLE,
  INDEX `caseNo_idx` (`caseNo` ASC) VISIBLE,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `mydb`.`Staff_All` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `districtID`
    FOREIGN KEY (`districtID`)
    REFERENCES `mydb`.`District` (`districtID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `caseNo`
    FOREIGN KEY (`caseNo`)
    REFERENCES `mydb`.`Criminal Case` (`caseNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Criminal Case`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Criminal Case` (
  `caseNo` INT NOT NULL,
  `Docket Number` INT(20) NULL,
  `caseType` VARCHAR(15) NULL,
  `criminal charges` VARCHAR(45) NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `caseStatus` VARCHAR(40) NULL,
  `clientID` INT NOT NULL,
  `prosecutorID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`caseNo`),
  INDEX `fk_Criminal Case_Client1_idx` (`clientID` ASC) VISIBLE,
  INDEX `fk_Criminal Case_Prosecutor_idx` (`prosecutorID` ASC) VISIBLE,
  INDEX `staffID_Attorney_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `clientID`
    FOREIGN KEY (`clientID`)
    REFERENCES `mydb`.`Client` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prosecutorID`
    FOREIGN KEY (`prosecutorID`)
    REFERENCES `mydb`.`Prosecutor` (`prosecutorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffID_Attorney`
    FOREIGN KEY (`staffID`)
    REFERENCES `mydb`.`Staff, Attorney` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Staff, Non-Attorney`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Staff, Non-Attorney` (
  `barNo` INT NOT NULL,
  `staffID` INT NOT NULL,
  `districtID` VARCHAR(10) NOT NULL,
  `clientID` INT NOT NULL,
  PRIMARY KEY (`barNo`),
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  INDEX `districtID_idx` (`districtID` ASC) VISIBLE,
  INDEX `clientID_idx` (`clientID` ASC) VISIBLE,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `mydb`.`Staff_All` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `districtID`
    FOREIGN KEY (`districtID`)
    REFERENCES `mydb`.`District` (`districtID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `clientID`
    FOREIGN KEY (`clientID`)
    REFERENCES `mydb`.`Client` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Client`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Client` (
  `clientID` INT NOT NULL,
  `fName` VARCHAR(20) NULL,
  `lName` VARCHAR(20) NULL,
  `DOB` DATE NULL,
  `phoneNo` INT NULL,
  `address` VARCHAR(40) NULL,
  `caseNo` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`clientID`),
  INDEX `caseNo_idx` (`caseNo` ASC) VISIBLE,
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  CONSTRAINT `caseNo`
    FOREIGN KEY (`caseNo`)
    REFERENCES `mydb`.`Criminal Case` (`caseNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `mydb`.`Staff, Non-Attorney` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Court Date`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Court Date` (
  `caseNo` INT NOT NULL,
  `Date` DATE NULL,
  `Type` VARCHAR(45) NULL,
  `Result` VARCHAR(45) NULL,
  PRIMARY KEY (`caseNo`),
  INDEX `Criminal Case_caseNo_idx` (`caseNo` ASC) VISIBLE,
  CONSTRAINT `caseNo`
    FOREIGN KEY (`caseNo`)
    REFERENCES `mydb`.`Criminal Case` (`caseNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
