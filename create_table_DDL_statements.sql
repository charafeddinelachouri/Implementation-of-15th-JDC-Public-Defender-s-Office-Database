CREATE TABLE IF NOT EXISTS `DBMS_Project`.`District` (
  `districtID` VARCHAR(10) NOT NULL,
  `address` VARCHAR(45) NULL,
  `phoneNo` INT NULL,
  PRIMARY KEY (`districtID`)
  );
CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Client` (
  `clientID` INT NOT NULL,
  `fName` VARCHAR(20) NULL,
  `lName` VARCHAR(20) NULL,
  `DOB` DATE NULL,
  `phoneNo` INT NULL,
  `address` VARCHAR(40) NULL,
  PRIMARY KEY (`clientID`)
  );
CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Prosecutor` (
  `prosecutorID` INT NOT NULL,
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
);
CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Attorney` (
  `staffID` INT NOT NULL,
  `barNo` INT NOT NULL,
  `fName` VARCHAR(45) NULL,
  `lName` VARCHAR(45) NULL,
  `phoneNo` VARCHAR(45) NULL,
  `districtID` VARCHAR(10) NULL,
  INDEX `districtID_idx` (`districtID` ASC) VISIBLE,
  PRIMARY KEY (`staffID`),
  CONSTRAINT `fk_districtID`
    FOREIGN KEY (`districtID`)
    REFERENCES `DBMS_Project`.`District` (`districtID`)
    );
    
CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Criminal_Case` (
  `caseNo` INT NOT NULL,
  `docketNo` INT(20) NULL,
  `caseType` VARCHAR(15) NULL,
  `criminal charges` VARCHAR(45) NULL,
  `startDate` DATE NULL,
  `endDate` DATE NULL,
  `caseStatus` VARCHAR(40) NULL,
  `clientID` INT NOT NULL,
  `prosecutorID` INT NOT NULL,
  `staffID` INT NOT NULL,
  PRIMARY KEY (`caseNo`),
  INDEX `fk_Criminal_Case_Client1_idx` (`clientID` ASC) VISIBLE,
  INDEX `staffID_idx` (`staffID` ASC) VISIBLE,
  INDEX `fk_prosecutorID_idx` (`prosecutorID` ASC) VISIBLE,
  CONSTRAINT `fk_clientID`
    FOREIGN KEY (`clientID`)
    REFERENCES `DBMS_Project`.`Client` (`clientID`),
  CONSTRAINT `fk_staffID`
    FOREIGN KEY (`staffID`)
    REFERENCES `DBMS_Project`.`Attorney` (`staffID`),
  CONSTRAINT `fk_prosecutorID`
    FOREIGN KEY (`prosecutorID`)
    REFERENCES `DBMS_Project`.`Prosecutor` (`prosecutorID`)
    );
    
CREATE TABLE IF NOT EXISTS `DBMS_Project`.`Court_Date` (
  `caseNo` INT NOT NULL,
  `date` DATE NOT NULL,
  `type` VARCHAR(45) NULL,
  `result` VARCHAR(45) NULL,
  PRIMARY KEY (`caseNo`, `date`),
  INDEX `Criminal_Case_caseNo_idx` (`caseNo` ASC) VISIBLE,
  CONSTRAINT `caseNo`
    FOREIGN KEY (`caseNo`)
    REFERENCES `DBMS_Project`.`Criminal_Case` (`caseNo`)
    );