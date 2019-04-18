DROP DATABASE IF EXISTS NOTICIAS;
CREATE DATABASE NOTICIAS;
USE NOTICIAS;

CREATE TABLE USUARIO(
	USU_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    USU_LOGIN VARCHAR(50) NOT NULL,
    USU_CLAVE VARCHAR(50) NOT NULL,
    USU_NOMBRE VARCHAR(50) NOT NULL,
    USU_APE_PATERNO VARCHAR(50) NOT NULL,
    USU_APE_MATERNO VARCHAR(50) NOT NULL,
    USU_TELEFONO VARCHAR(9) NULL,
    USU_DIRECCION VARCHAR(100) NULL,
    USU_DISTRITO INT NOT NULL,
    USU_FECHA_CREACION DATE NOT NULL,
    USU_FECHA_MODIFICACION DATE NULL
);

CREATE TABLE ROL(
	ROL_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    ROL_NOMBRE VARCHAR(50) NOT NULL,
    ROL_DESCRIPCION VARCHAR(50) NULL,
    ROL_FECHA_CREACION DATE NOT NULL,
    ROL_FECHA_MODIFICACION DATE NULL
);

CREATE TABLE PERMISO(
	PER_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    PER_NOMBRE VARCHAR(50) NOT NULL,
    PER_DESCRIPCION VARCHAR(50) NULL,
    PER_RUTA VARCHAR(150) NOT NULL,
    PER_FECHA_CREACION DATE NOT NULL,
    PER_FECHA_MODIFICACION DATE NULL
);

CREATE TABLE ROL_PERMISO(
	ROL_ID INT NOT NULL,
		INDEX IX_ROL_PERMISO__ROL_ID(ROL_ID),
        FOREIGN KEY (ROL_ID) REFERENCES ROL(ROL_ID),
    PER_ID INT NOT NULL,
		INDEX IX_ROL_PERMISO__PER_ID(PER_ID),
        FOREIGN KEY (PER_ID) REFERENCES PERMISO(PER_ID)
);

CREATE TABLE ROL_USUARIO(
	ROL_ID INT NOT NULL,
		INDEX IX_ROL_USUARIO__ROL_ID(ROL_ID),
        FOREIGN KEY (ROL_ID) REFERENCES ROL(ROL_ID),
	USU_ID INT NOT NULL,
		INDEX IX_ROL_USUARIO__USU_ID(USU_ID),
        FOREIGN KEY (USU_ID) REFERENCES USUARIO(USU_ID)
);

CREATE TABLE PROPIEDADES(
	PRO_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    PRO_NOMBRE VARCHAR(50) NOT NULL,
    PRO_DESCRIPCION VARCHAR(50) NULL,
    PRO_VALOR VARCHAR(250) NOT NULL
);

CREATE TABLE NOTICIA(
	NOT_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    NOT_TITULAR VARCHAR(100) NOT NULL,
    NOT_DESC_TITULAR VARCHAR(100) NOT NULL,
    NOT_CONTENIDO VARCHAR(1000) NOT NULL,
    NOT_RUTA_IMAGEN VARCHAR(100) NOT NULL,
    NOT_DESTACAR CHAR(1) NOT NULL,
    CAT_ID INT NOT NULL,
    NOT_FECHA_CREACION DATETIME NOT NULL,
    NOT_FECHA_MODIFICACION DATETIME NULL
);

CREATE TABLE CATEGORIA(
	CAT_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    CAT_NOMBRE VARCHAR(50) NOT NULL,
    CAT_DESCRIPCION VARCHAR(100) NULL,
    TIP_ID INT NOT NULL,
    CAT_FECHA_CREACION DATE NOT NULL,
    CAT_FECHA_MODIFICACION DATE NULL
);

CREATE TABLE TIPO(
	TIP_ID INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    TIP_NOMBRE VARCHAR(50) NOT NULL,
    TIP_DESCRIPCION VARCHAR(100) NULL,
    TIP_FECHA_CREACION DATE NOT NULL,
    TIP_FECHA_MODIFICACION DATE NULL
);




















