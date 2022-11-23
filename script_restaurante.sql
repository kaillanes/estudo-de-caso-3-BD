-- -----------------------------------------------------
-- Schema restaurante
-- -----------------------------------------------------
CREATE DATABASE restaurante;
USE restaurante;

-- -----------------------------------------------------
-- Table `mydb`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`clientes` (
  `idcliente` INT NOT NULL AUTO_INCREMENT,
  `nome_completo` VARCHAR(45) NOT NULL,
  `email` VARCHAR(45) NOT NULL,
  `telefone` VARCHAR(19) NOT NULL,
  `data_nasc` DATE NOT NULL,
  PRIMARY KEY (`idcliente`),
  UNIQUE INDEX `idcliente_UNIQUE` (`idcliente` ASC) VISIBLE,
  UNIQUE INDEX `email_UNIQUE` (`email` ASC) VISIBLE,
  UNIQUE INDEX `telefone_UNIQUE` (`telefone` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`table2`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`table2` (
)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`cardapios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`cardapios` (
  `idprato` INT NOT NULL AUTO_INCREMENT,
  `nome_prato` VARCHAR(45) NOT NULL,
  `valor_prato` VARCHAR(8) NOT NULL,
  `descricao` VARCHAR(200) NOT NULL,
  PRIMARY KEY (`idprato`),
  UNIQUE INDEX `idprato_UNIQUE` (`idprato` ASC) VISIBLE,
  UNIQUE INDEX `nome_prato_UNIQUE` (`nome_prato` ASC) VISIBLE,
  UNIQUE INDEX `descricao_UNIQUE` (`descricao` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`mesas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`mesas` (
  `idmesa` INT NOT NULL AUTO_INCREMENT,
  `n_lugares` INT NOT NULL,
  `status` VARCHAR(14) NOT NULL,
  PRIMARY KEY (`idmesa`),
  UNIQUE INDEX `idmesa_UNIQUE` (`idmesa` ASC) VISIBLE)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`reservas`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`reservas` (
  `idreserva` INT NOT NULL AUTO_INCREMENT,
  `horario` TIME NOT NULL,
  `cliente_idcliente` INT NOT NULL,
  `mesa_idmesa` INT NOT NULL,
  PRIMARY KEY (`idreserva`),
  UNIQUE INDEX `idreserva_UNIQUE` (`idreserva` ASC) VISIBLE,
  INDEX `fk_reserva_cliente1_idx` (`cliente_idcliente` ASC) VISIBLE,
  INDEX `fk_reserva_mesa1_idx` (`mesa_idmesa` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_cliente1`
    FOREIGN KEY (`cliente_idcliente`)
    REFERENCES `mydb`.`clientes` (`idcliente`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_mesa1`
    FOREIGN KEY (`mesa_idmesa`)
    REFERENCES `mydb`.`mesas` (`idmesa`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`pedidos` (
  `reserva_idreserva` INT NOT NULL,
  `cardapio_idprato` INT NOT NULL,
  `horario` TIME NOT NULL,
  PRIMARY KEY (`reserva_idreserva`, `cardapio_idprato`),
  INDEX `fk_reserva_has_cardapio_cardapio1_idx` (`cardapio_idprato` ASC) VISIBLE,
  INDEX `fk_reserva_has_cardapio_reserva1_idx` (`reserva_idreserva` ASC) VISIBLE,
  CONSTRAINT `fk_reserva_has_cardapio_reserva1`
    FOREIGN KEY (`reserva_idreserva`)
    REFERENCES `mydb`.`reservas` (`idreserva`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_reserva_has_cardapio_cardapio1`
    FOREIGN KEY (`cardapio_idprato`)
    REFERENCES `mydb`.`cardapios` (`idprato`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
