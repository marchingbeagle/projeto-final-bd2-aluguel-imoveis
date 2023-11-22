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
-- Table `mydb`.`pessoas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pessoas` (
  `idpessoas` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `cpf` VARCHAR(11) NOT NULL,
  `data_nascimento` DATETIME NOT NULL,
  `endereco` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(45) NOT NULL,
  `sexo` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`idpessoas`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`locacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`locacao` (
  `idloacacao` INT NOT NULL,
  `inquilino` INT NOT NULL,
  `valor_contrato` INT NOT NULL,
  `vigencia` DATETIME NOT NULL,
  `localizacao` INT NOT NULL,
  `corretor` INT NOT NULL,
  PRIMARY KEY (`idloacacao`, `corretor`, `inquilino`),
  INDEX `fk_idpessoas_idx` (`corretor` ASC, `inquilino` ASC) VISIBLE,
  CONSTRAINT `fk_idpessoas`
    FOREIGN KEY (`corretor` , `inquilino`)
    REFERENCES `mydb`.`pessoas` (`idpessoas` , `idpessoas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`estado`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`estado` (
  `idestado` INT NOT NULL,
  `nome_estado` VARCHAR(45) NOT NULL,
  `sigla_estado` VARCHAR(2) NOT NULL,
  PRIMARY KEY (`idestado`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cidade`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cidade` (
  `idcidade` INT NOT NULL,
  `nome` VARCHAR(45) NOT NULL,
  `estado` INT NOT NULL,
  PRIMARY KEY (`idcidade`),
  INDEX `fk.idestado_idx` (`estado` ASC) VISIBLE,
  CONSTRAINT `fk.idestado`
    FOREIGN KEY (`estado`)
    REFERENCES `mydb`.`estado` (`idestado`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `idcategoria` INT NOT NULL,
  `nome` VARCHAR(45) NULL,
  `descricao` VARCHAR(45) NULL,
  `data_criacao` DATETIME NULL,
  `data_atualizacao` DATETIME NULL,
  PRIMARY KEY (`idcategoria`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`localizacao`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`localizacao` (
  `idlocalizacao` INT NOT NULL,
  `cep` VARCHAR(8) NOT NULL,
  `numero_imovel` VARCHAR(10) NOT NULL,
  `complemento` VARCHAR(45) NULL,
  `referencia` VARCHAR(45) NULL,
  `cidade` INT NULL,
  `categoria` INT NULL,
  PRIMARY KEY (`idlocalizacao`),
  INDEX `fk_idcidade_idx` (`cidade` ASC) VISIBLE,
  INDEX `fk_idcategoria_idx` (`categoria` ASC) VISIBLE,
  CONSTRAINT `fk_idcidade`
    FOREIGN KEY (`cidade`)
    REFERENCES `mydb`.`cidade` (`idcidade`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idcategoria`
    FOREIGN KEY (`categoria`)
    REFERENCES `mydb`.`categoria` (`idcategoria`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`log`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`log` (
  `idlog` INT NOT NULL,
  `titulo` VARCHAR(45) NOT NULL,
  `descricao` VARCHAR(45) NOT NULL,
  `data` DATETIME NOT NULL,
  PRIMARY KEY (`idlog`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`imovel`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`imovel` (
  `idimovel` INT NOT NULL,
  `localizacao` INT NULL,
  `proprietario` INT NULL,
  `preco_compra` INT NULL,
  `preco_aluguel` INT NULL,
  PRIMARY KEY (`idimovel`),
  INDEX `fk_idlocalizacao_idx` (`localizacao` ASC) VISIBLE,
  INDEX `fk_idproprietario_idx` (`proprietario` ASC) VISIBLE,
  CONSTRAINT `fk_idlocalizacao`
    FOREIGN KEY (`localizacao`)
    REFERENCES `mydb`.`localizacao` (`idlocalizacao`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_idproprietario`
    FOREIGN KEY (`proprietario`)
    REFERENCES `mydb`.`pessoas` (`idpessoas`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
