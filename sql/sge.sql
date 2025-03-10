-- -----------------------------------------------------
-- Schema SGE
-- -----------------------------------------------------

IF NOT EXISTS (SELECT * FROM sys.schemas WHERE name = 'sge')
BEGIN
    EXEC('CREATE SCHEMA sge');
END


-- Estados
-- ========================


CREATE TABLE sge.estados (
    es_id INT IDENTITY(1,1) PRIMARY KEY,
    es_nombre VARCHAR(20) NOT NULL,
    CONSTRAINT UQ_Estado UNIQUE (es_nombre)
);

INSERT INTO estados (es_nombre) VALUES ('Activo'), ('Inactivo'), ('Bloqueado');

-- Departamentos
-- ========================

CREATE TABLE sge.departamentos (
    de_id INT PRIMARY KEY IDENTITY(1,1),
    de_departamento VARCHAR(100) NOT NULL,
    CONSTRAINT UQ_Departamento UNIQUE (de_departamento)
);

INSERT INTO sge.departamentos (de_departamento) VALUES ('Sin Departamento'), ('System'), ('Contabilidad'), ('RRHH'), ('Operaciones'), ('TI');

-- Cargos
-- ========================

CREATE TABLE sge.cargos (
    ca_id INT PRIMARY KEY IDENTITY,
    ca_cargo VARCHAR(100) NOT NULL,
    ca_departamento INT NOT NULL,
    CONSTRAINT FK_cargo_departamento FOREIGN KEY (ca_departamento) REFERENCES sge.de_departamentos(de_id) ON DELETE CASCADE
);

INSERT INTO sge.cargos (ca_cargo, ca_departamento) VALUES ('System', 2);


-- Usuarios
-- ========================

CREATE TABLE sge.usuarios (
    us_id INT PRIMARY KEY IDENTITY(1,1),
    us_username VARCHAR(50) NOT NULL,
    us_password VARCHAR(255) NOT NULL,
    us_nombre VARCHAR(50) NOT NULL,
    us_apellido VARCHAR(50) NOT NULL,
    us_departamento INT DEFAULT 1,
    us_cargo INT INT DEFAULT 1,
    us_email VARCHAR(100) UNIQUE NOT NULL,
    us_celular VARCHAR(20) NULL,
    us_salario DECIMAL(10,2) NOT NULL,
    us_estado INT NOT NULL,
    us_fecha_ingreso DATETIME DEFAULT GETDATE(),
    us_fecha_actualizacion DATETIME DEFAULT GETDATE(),
    CONSTRAINT UQ_username UNIQUE (us_username),
    CONSTRAINT FK_Usuarios_Estados FOREIGN KEY (us_estado) REFERENCES estados(es_id) ON DELETE CASCADE,
    CONSTRAINT FK_usuario_departamento FOREIGN KEY (us_departamento) REFERENCES sge.de_departamentos(de_id) ON DELETE CASCADE,
    CONSTRAINT FK_usuario_cargo FOREIGN KEY (us_cargo) REFERENCES sge.de_cargos(ca_id) ON DELETE CASCADE
);

INSERT INTO sge.usuarios (us_username, us_password, us_nombre, us_apellido, us_email, us_estado, us_departamento, us_cargo, us_salario) 
VALUES ('django_api', HASHBYTES('SHA2_256', 'Clave123'), 'API Rest', 'Django', 'ruizjorgeleonardo@gmail.com', 1, 2, 1, 0);


-- Pagos
-- ==========================

CREATE TABLE sge.pagos (
    pg_id INT PRIMARY KEY IDENTITY,
    pg_usuario_id INT FOREIGN KEY REFERENCES Empleados(id),
    pg_periodo_id INT FOREIGN KEY REFERENCES Periodos(id),
    pg_monto DECIMAL(10,2) NOT NULL,
    pg_fecha_pago DATETIME DEFAULT GETDATE()
);






-- ==========================
-- SISTEMA DE PERMISOS
-- ==========================

-- Permisos por Rol por Tabla
-- ==========================

CREATE TABLE sge.permisos_rol_tabla (
    pe_id INT PRIMARY KEY IDENTITY(1,1),
    pe_rol_id INT NOT NULL,
    pe_tabla VARCHAR(50) NOT NULL,
    pe_leer BIT DEFAULT 0,
    pe_insertar BIT DEFAULT 0,
    pe_actualizar BIT DEFAULT 0,
    pe_eliminar BIT DEFAULT 0,
    CONSTRAINT FK_permiso_rol FOREIGN KEY (pe_rol_id) REFERENCES sge.roles(ro_id) ON DELETE CASCADE
);

-- Permisos por Usuario por Tabla
-- ==========================

CREATE TABLE sge.permisos_rol_tabla (
    pu_id INT PRIMARY KEY IDENTITY(1,1),
    pu_usuario_id INT NOT NULL,
    pu_tabla VARCHAR(50) NOT NULL,
    pu_leer BIT DEFAULT 0,
    pu_insertar BIT DEFAULT 0,
    pu_actualizar BIT DEFAULT 0,
    pu_eliminar BIT DEFAULT 0,
    CONSTRAINT FK_permiso_usuario FOREIGN KEY (pu_usuario_id) REFERENCES sge.usuarios(us_id) ON DELETE CASCADE
);




