

-- 
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS PROYECTO DEFAULT CHARACTER SET utf8 ;
USE PROYECTO ;

-- -----------------------------------------------------
-- Table :usuario
-- -----------------------------------------------------
CREATE TABLE usuario (
  identificacion INT NOT NULL,
  correo VARCHAR(100) NOT NULL,
  fecha_de_ingreso DATE NOT NULL,
  contraseña VARCHAR(45) NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  apellidos VARCHAR(45) NULL,
  usuariocol VARCHAR(45) NOT NULL,
  estado BIT(1) NOT NULL,
  rol VARCHAR(45) NOT NULL,
  PRIMARY KEY (identificacion),
  UNIQUE INDEX correo_UNIQUE (correo ) 
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table :n_de producto
-- -----------------------------------------------------
CREATE TABLE n_de_producto (
  cantidad DECIMAL NOT NULL,
  PRIMARY KEY (cantidad)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table :pedido
-- -----------------------------------------------------
CREATE TABLE pedido (
  codigo INT NOT NULL,
  identificacion INT NOT NULL,
  cantidad DECIMAL NOT NULL,
  direccion DATE NOT NULL,
  fecha VARCHAR(20) NOT NULL,
  iva DECIMAL(10,2) NOT NULL,
  total DECIMAL(10,2) NOT NULL,
  forma_de_pago VARCHAR(45) NOT NULL,
  estado VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo),
  INDEX ind_pedido_usuario (identificacion ) ,
  INDEX ind_pedido_n_de_producto (cantidad ) ,
  CONSTRAINT fk_pedido_usuario
    FOREIGN KEY (identificacion)
    REFERENCES usuario (identificacion)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_pedido_n_de_producto
    FOREIGN KEY (cantidad)
    REFERENCES n_de_producto (cantidad)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table :categoria
-- -----------------------------------------------------
CREATE TABLE categoria (
  codigo INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  PRIMARY KEY (codigo)
  )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table :lista de productos
-- -----------------------------------------------------
CREATE TABLE lista_de_productos (
 cantidad INT NOT NULL,
 fecha_c VARCHAR(45) NOT NULL,
  PRIMARY KEY (cantidad))
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table :producto
-- -----------------------------------------------------
CREATE TABLE producto (
 codigo_ INT NOT NULL,
 cantidad_ DECIMAL NOT NULL,
 codigo INT NOT NULL,
  cantidad INT NOT NULL,
  nombre VARCHAR(45) NOT NULL,
  precio_v DECIMAL(10,2) NOT NULL,
  stok VARCHAR(500) NOT NULL,
  referencia VARCHAR(100) NOT NULL,
  PRIMARY KEY (codigo),
  INDEX ind_producto_n_de_producto (cantidad_) ,
  INDEX ind_producto_categoria (codigo_ ) ,
  INDEX ind_producto_lista_de_productos (cantidad ) ,
  CONSTRAINT fk_producto_n_de_producto
    FOREIGN KEY (cantidad_)
    REFERENCES n_de_producto (cantidad)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_producto_categoria
    FOREIGN KEY (codigo_)
    REFERENCES categoria (codigo)
    ON DELETE CASCADE
    ON UPDATE CASCADE,
  CONSTRAINT fk_producto_lista_de_productos
    FOREIGN KEY (cantidad)
    REFERENCES lista de productos (cantidad)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    )
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table :compra
-- -----------------------------------------------------
CREATE TABLE compra (
  codigo INT NOT NULL,
  cantidad INT NOT NULL,
  total_a_pagar DECIMAL(10,2) NOT NULL,
  fecha_c DATE NOT NULL,
  PRIMARY KEY (codigo),
  INDEX ind_compra_lista_de_productos (cantidad ) ,
  CONSTRAINT fk_compra_lista_de_productos
    FOREIGN KEY (cantidad)
    REFERENCES lista_de_productos (cantidad)
    ON DELETE CASCADE
    ON UPDATE CASCADE
    )
ENGINE = InnoDB;


