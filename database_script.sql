CREATE SCHEMA IF NOT EXISTS `english_now` DEFAULT CHARACTER SET utf8;

CREATE TABLE IF NOT EXISTS `english_now`.`papel` (
  `papel_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  PRIMARY KEY (`papel_id`))
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `english_now`.`usuario` (
  `usuario_id` INT NOT NULL AUTO_INCREMENT,
  `login` VARCHAR(255) NOT NULL,
  `senha` VARCHAR(255) NOT NULL,
  `papel_id` INT NOT NULL,
  `aluno_id` INT NOT NULL,
  PRIMARY KEY (`usuario_id`),
  INDEX `usuario_papel_idx` (`papel_id` ASC) VISIBLE,
  CONSTRAINT `usuario_papel`
    FOREIGN KEY (`papel_id`)
    REFERENCES `english_now`.`papel` (`papel_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `english_now`.`aluno` (
  `aluno_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(50) NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`aluno_id`),
  INDEX `aluno_usuario_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `aluno_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `english_now`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `english_now`.`professor` (
  `professor_id` INT NOT NULL AUTO_INCREMENT,
  `nome` VARCHAR(255) NOT NULL,
  `email` VARCHAR(255) NOT NULL,
  `usuario_id` INT NOT NULL,
  PRIMARY KEY (`professor_id`),
  INDEX `professor_usuario_idx` (`usuario_id` ASC) VISIBLE,
  CONSTRAINT `professor_usuario`
    FOREIGN KEY (`usuario_id`)
    REFERENCES `english_now`.`usuario` (`usuario_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `english_now`.`turma` (
  `turma_id` INT NOT NULL AUTO_INCREMENT,
  `semestre` INT NOT NULL,
  `ano` INT NOT NULL,
  `periodo` VARCHAR(150) NOT NULL,
  `nivel` VARCHAR(30) NOT NULL,
  `professor_id` INT NOT NULL,
  PRIMARY KEY (`turma_id`),
  INDEX `turma_professor_idx` (`professor_id` ASC) VISIBLE,
  CONSTRAINT `turma_professor`
    FOREIGN KEY (`professor_id`)
    REFERENCES `english_now`.`professor` (`professor_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;

CREATE TABLE IF NOT EXISTS `english_now`.`aluno_turma_boletim` (
  `aluno_turma_boletim_id` INT NOT NULL AUTO_INCREMENT,
  `nota_bim1_escrita` DECIMAL(4,2) NULL,
  `nota_bim1_leitura` DECIMAL(4,2) NULL,
  `nota_bim1_conversacao` DECIMAL(4,2) NULL,
  `nota_bim1_final` DECIMAL(4,2) NULL,
  `nota_bim2_leitura` DECIMAL(4,2) NULL,
  `nota_bim2_escrita` DECIMAL(4,2) NULL,
  `nota_bim2_conversacao` DECIMAL(4,2) NULL,
  `nota_bim2_final` DECIMAL(4,2) NULL,
  `nota_final_semestre` DECIMAL(4,2) NULL,
  `faltas_semestre` INT NULL,
  `aluno_id` INT NOT NULL,
  `turma_id` INT NOT NULL,
  PRIMARY KEY (`aluno_turma_boletim_id`),
  INDEX `aluno_boletim_idx` (`aluno_id` ASC) VISIBLE,
  INDEX `turma_boletim_idx` (`turma_id` ASC) VISIBLE,
  CONSTRAINT `aluno_boletim`
    FOREIGN KEY (`aluno_id`)
    REFERENCES `english_now`.`aluno` (`aluno_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT `turma_boletim`
    FOREIGN KEY (`turma_id`)
    REFERENCES `english_now`.`turma` (`turma_id`)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION)
ENGINE = InnoDB;



