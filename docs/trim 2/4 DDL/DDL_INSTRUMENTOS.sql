-- MySQL Script generated by MySQL Workbench
-- Thu Sep 22 21:39:33 2022
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
-- Table `mydb`.`usuario`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`usuario` (
  `identificacion` INT NOT NULL,
  `correo` VARCHAR(100) NOT NULL,
  `fecha de ingreso` DATE NOT NULL,
  `contraseña` VARCHAR(45) NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `apellidos` VARCHAR(45) NULL,
  `usuariocol` VARCHAR(45) NOT NULL,
  `estado` BIT(1) NOT NULL,
  `rol` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`identificacion`),
  UNIQUE INDEX `correo_UNIQUE` (`correo` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`n_de producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`n_de producto` (
  `cantidad` DECIMAL NOT NULL,
  PRIMARY KEY (`cantidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedido` (
  `codigo` INT NOT NULL,
  `identificacion` INT NOT NULL,
  `cantidad` DECIMAL NOT NULL,
  `direccion` DATE NOT NULL,
  `fecha` VARCHAR(20) NOT NULL,
  `iva` DECIMAL(10,2) NOT NULL,
  `total` DECIMAL(10,2) NOT NULL,
  `forma de pago` VARCHAR(45) NOT NULL,
  `estado` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `ind_pedido_usuario` (`identificacion` ASC) VISIBLE,
  INDEX `ind_pedido_n_de producto` (`cantidad` ASC) INVISIBLE,
  CONSTRAINT `fk_pedido_usuario`
    FOREIGN KEY (`identificacion`)
    REFERENCES `mydb`.`usuario` (`identificacion`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_pedido_n_de producto`
    FOREIGN KEY (`cantidad`)
    REFERENCES `mydb`.`n_de producto` (`cantidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`categoria`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`categoria` (
  `codigo` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`codigo`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`lista de productos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`lista de productos` (
  `cantidad` INT NOT NULL,
  `fecha_c` VARCHAR(45) NOT NULL,
  PRIMARY KEY (`cantidad`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`producto`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`producto` (
  `codigo` INT NOT NULL,
  `cantidad` DECIMAL NOT NULL,
  `codigo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `nombre` VARCHAR(45) NOT NULL,
  `precio_v` DECIMAL(10,2) NOT NULL,
  `stok` VARCHAR(500) NOT NULL,
  `referencia` VARCHAR(100) NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `ind_producto_n_de producto` (`cantidad` ASC) INVISIBLE,
  INDEX `ind_producto_categoria` (`codigo` ASC) INVISIBLE,
  INDEX `ind_producto_lista de productos` (`cantidad` ASC) VISIBLE,
  CONSTRAINT `fk_producto_n_de producto`
    FOREIGN KEY (`cantidad`)
    REFERENCES `mydb`.`n_de producto` (`cantidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_categoria`
    FOREIGN KEY (`codigo`)
    REFERENCES `mydb`.`categoria` (`codigo`)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT `fk_producto_lista de productos`
    FOREIGN KEY (`cantidad`)
    REFERENCES `mydb`.`lista de productos` (`cantidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`compra`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`compra` (
  `codigo` INT NOT NULL,
  `cantidad` INT NOT NULL,
  `total a pagar` DECIMAL(10,2) NOT NULL,
  `fecha_c` DATE NOT NULL,
  PRIMARY KEY (`codigo`),
  INDEX `ind_compra_lista de productos` (`cantidad` ASC) INVISIBLE,
  CONSTRAINT `fk_compra_lista de productos`
    FOREIGN KEY (`cantidad`)
    REFERENCES `mydb`.`lista de productos` (`cantidad`)
    ON DELETE CASCADE
    ON UPDATE CASCADE)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;