-- Tabellen, unverbunden

DROP TABLE IF EXISTS mydb.cats;
DROP TABLE IF EXISTS mydb.servants;

-- Mastertabelle (MT):, unverändert
CREATE TABLE IF NOT EXISTS `mydb`.`cats` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `cat_name` VARCHAR(45) NOT NULL,
  `fur_color` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;

-- Detailtabelle (DT): Verbindung zur MT über Fremdschlüssel
CREATE TABLE IF NOT EXISTS `mydb`.`servants` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `servant_name` VARCHAR(45) NOT NULL,
  `yrs_served` INT NOT NULL,
  `catrs_id` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_servants_catrs_idx` (`catrs_id` ASC),
  CONSTRAINT `fk_servants_catrs`
    FOREIGN KEY (`catrs_id`)
    REFERENCES `mydb`.`catrs` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

DESCRIBE mydb.cats;
DESCRIBE mydb.servants;