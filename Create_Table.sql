CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Staff_All` (
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

CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Staff, Non-Attorney` (
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
    REFERENCES `DBMS_Project`.`Staff_All` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `districtID`
    FOREIGN KEY (`districtID`)
    REFERENCES `DBMS_Project`.`District` (`districtID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `clientID`
    FOREIGN KEY (`clientID`)
    REFERENCES `DBMS_Project`.`Client` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Staff, Attorney` (
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
    REFERENCES `DBMS_Project`.`Staff_All` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `districtID`
    FOREIGN KEY (`districtID`)
    REFERENCES `DBMS_Project`.`District` (`districtID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `caseNo`
    FOREIGN KEY (`caseNo`)
    REFERENCES `DBMS_Project`.`Criminal Case` (`caseNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `DBMS_Project`.`District` (
  `districtID` VARCHAR(10) NOT NULL,
  `Address` VARCHAR(45) NULL,
  `phoneNo` INT NULL,
  PRIMARY KEY (`districtID`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Criminal Case` (
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
    REFERENCES `DBMS_Project`.`Client` (`clientID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `prosecutorID`
    FOREIGN KEY (`prosecutorID`)
    REFERENCES `DBMS_Project`.`Prosecutor` (`prosecutorID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffID_Attorney`
    FOREIGN KEY (`staffID`)
    REFERENCES `DBMS_Project`.`Staff, Attorney` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Client` (
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
    REFERENCES `DBMS_Project`.`Criminal Case` (`caseNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `DBMS_Project`.`Staff, Non-Attorney` (`staffID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Court Date` (
  `caseNo` INT NOT NULL,
  `Date` DATE NULL,
  `Type` VARCHAR(45) NULL,
  `Result` VARCHAR(45) NULL,
  PRIMARY KEY (`caseNo`),
  INDEX `Criminal Case_caseNo_idx` (`caseNo` ASC) VISIBLE,
  CONSTRAINT `caseNo`
    FOREIGN KEY (`caseNo`)
    REFERENCES `DBMS_Project`.`Criminal Case` (`caseNo`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Prosecutor` (
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
    REFERENCES `DBMS_Project`.`District` (`districtID`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

