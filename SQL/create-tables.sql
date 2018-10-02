CREATE TABLE `bairro` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `id_cidade` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_bairro_cidade` (`id_cidade`),
  CONSTRAINT `FK_bairro_cidade` FOREIGN KEY (`id_cidade`) REFERENCES `cidade` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `calendario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inicio_servico` datetime NOT NULL,
  `fim_servico` datetime NOT NULL,
  `classificacao` int(11) NOT NULL,
  `valor` double NOT NULL,
  `id_cliente` int(10) unsigned NOT NULL,
  `id_usuario_prestador` int(10) unsigned NOT NULL,
  `situacao` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_calendario_servico` (`situacao`),
  KEY `FK_calendario_pestador_servico` (`id_usuario_prestador`),
  KEY `FK_calendario_usuario` (`id_cliente`),
  CONSTRAINT `FK_calendario_pestador_servico` FOREIGN KEY (`id_usuario_prestador`) REFERENCES `prestador_servico` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `FK_calendario_usuario` FOREIGN KEY (`id_cliente`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `cidade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(40) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8;

CREATE TABLE `prestador_servico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prestador` int(10) unsigned NOT NULL,
  `id_servico` int(10) unsigned NOT NULL,
  `valor_hora` double NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_pestador_servico_usuario` (`id_prestador`),
  KEY `FK_pestador_servico_servico` (`id_servico`),
  CONSTRAINT `FK_pestador_servico_servico` FOREIGN KEY (`id_servico`) REFERENCES `servico` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION,
  CONSTRAINT `FK_pestador_servico_usuario` FOREIGN KEY (`id_prestador`) REFERENCES `usuario` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `servico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `servico` varchar(90) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `situacao` (
  `situacao_servico` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

CREATE TABLE `usuario` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `inscricao_federal` varchar(14) NOT NULL,
  `nome` varchar(60) NOT NULL,
  `email` varchar(240) NOT NULL,
  `senha` varchar(60) NOT NULL,
  `rua` varchar(320) NOT NULL,
  `numero` int(10) NOT NULL,
  `sexo` int(1) NOT NULL,
  `telefone` varchar(15) NOT NULL,
  `cliente` tinyint(1) NOT NULL,
  `prestador` tinyint(1) NOT NULL,
  `id_bairro` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uk_email` (`email`),
  UNIQUE KEY `uk_inscricao_federal` (`inscricao_federal`)
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=latin1;

CREATE TABLE `usuario_servico` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_prestador` int(10) unsigned NOT NULL,
  `id_servico` int(10) unsigned NOT NULL,
  `valor_horas` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;