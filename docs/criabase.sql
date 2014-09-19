

-- -----------------------------------------------------
-- Table `loja`.`departamentos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`departamentos` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(50) NOT NULL,
  PRIMARY KEY (`id`))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja`.`produtos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`produtos` (
  `id` INT NOT NULL,
  `nome` VARCHAR(150) NOT NULL,
  `detalhes` TEXT NULL,
  `preco` DECIMAL(10,2) NOT NULL DEFAULT 0,
  `id_departamento` INT NOT NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_produtos_departamentos_idx` (`id_departamento` ASC),
  CONSTRAINT `fk_produtos_departamentos`
    FOREIGN KEY (`id_departamento`)
    REFERENCES `loja`.`departamentos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja`.`clientes`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`clientes` (
  `id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `senha` VARCHAR(12) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja`.`pedidos`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`pedidos` (
  `id` INT NOT NULL,
  `registrado_em` TIMESTAMP NULL,
  `situacao` CHAR(1) NULL,
  `id_cliente` INT NOT NULL,
  `valor_desconto` DECIMAL(10,2) NULL,
  PRIMARY KEY (`id`),
  INDEX `fk_pedidos_clientes1_idx` (`id_cliente` ASC),
  CONSTRAINT `fk_pedidos_clientes1`
    FOREIGN KEY (`id_cliente`)
    REFERENCES `loja`.`clientes` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja`.`itens_pedido`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`itens_pedido` (
  `id_pedido` INT NOT NULL,
  `id_produto` INT NOT NULL,
  `quantidade` INT NOT NULL,
  `preco` DECIMAL(10,2) NOT NULL,
  PRIMARY KEY (`id_pedido`, `id_produto`),
  INDEX `fk_itens_pedido_produtos1_idx` (`id_produto` ASC),
  INDEX `fk_itens_pedido_pedidos1_idx` (`id_pedido` ASC),
  CONSTRAINT `fk_itens_pedido_produtos1`
    FOREIGN KEY (`id_produto`)
    REFERENCES `loja`.`produtos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `fk_itens_pedido_pedidos1`
    FOREIGN KEY (`id_pedido`)
    REFERENCES `loja`.`pedidos` (`id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `loja`.`usuarios`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `loja`.`usuarios` (
  `id` INT NOT NULL,
  `nome` VARCHAR(60) NOT NULL,
  `email` VARCHAR(60) NOT NULL,
  `login` VARCHAR(20) NOT NULL,
  `senha` VARCHAR(12) NULL,
  PRIMARY KEY (`id`),
  UNIQUE INDEX `email_UNIQUE` (`email` ASC),
  UNIQUE INDEX `login_UNIQUE` (`login` ASC))
ENGINE = InnoDB;
