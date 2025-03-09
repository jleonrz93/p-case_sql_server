# Implementación Técnica - BD SGE
## Base de datos (SQL Server)

Se cuenta con las siguientes tablas:
### 1. Usuarios y Roles

```sql
CREATE TABLE Usuarios (
    id INT PRIMARY KEY IDENTITY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    primer_nombre VARCHAR(50) NOT NULL,
    segundo_nombre VARCHAR(50) NULL,
    apellido VARCHAR(50) NOT NULL,
    celular VARCHAR(20) NULL,
    estado VARCHAR(20) CHECK (estado IN ('activo', 'inactivo', 'bloqueado')) DEFAULT 'activo',
    fecha_creacion DATETIME DEFAULT GETDATE(),
    fecha_actualizacion DATETIME DEFAULT GETDATE()
);


CREATE TABLE Roles (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(50) UNIQUE NOT NULL
);

CREATE TABLE UsuarioRol (
    usuario_id INT FOREIGN KEY REFERENCES Usuarios(id),
    rol_id INT FOREIGN KEY REFERENCES Roles(id),
    PRIMARY KEY (usuario_id, rol_id)
);

```
### 2. Permisos de Acceso
```sql
CREATE TABLE Permisos (
    id INT PRIMARY KEY IDENTITY,
    rol_id INT FOREIGN KEY REFERENCES Roles(id),
    tabla VARCHAR(50) NOT NULL,
    columnas_permitidas VARCHAR(MAX), -- Lista de columnas accesibles
    puede_leer BIT DEFAULT 0,
    puede_insertar BIT DEFAULT 0,
    puede_actualizar BIT DEFAULT 0,
    puede_eliminar BIT DEFAULT 0,
    departamento_id INT NULL FOREIGN KEY REFERENCES Departamentos(id) -- Permisos por área
);


```
### 3. Restricción por permisos
```sql
CREATE TABLE PermisosRegistros (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT FOREIGN KEY REFERENCES Usuarios(id),
    tabla VARCHAR(50) NOT NULL,
    registro_id INT NOT NULL,
    tipo_permiso VARCHAR(20) CHECK (tipo_permiso IN ('leer', 'insertar', 'actualizar', 'eliminar'))
);

```

### 4. Sistema de Nómina

- **Empleados**: Información de los trabajadores.
- **Departamento**: organizar los empleados por área.
- **Cargos**: Define los cargos dentro de un departamento.
- **Periodos**: Define ciclos de pago.
- **Pagos**: Registra cada transacción de nómina.

```sql
CREATE TABLE Departamentos (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100) NOT NULL
);

CREATE TABLE Puestos (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    departamento_id INT FOREIGN KEY REFERENCES Departamentos(id)
);

CREATE TABLE Empleados (
    id INT PRIMARY KEY IDENTITY,
    nombre VARCHAR(100) NOT NULL,
    apellido VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    telefono VARCHAR(20) NULL,
    fecha_ingreso DATE NOT NULL,
    salario DECIMAL(10,2) NOT NULL,
    puesto_id INT FOREIGN KEY REFERENCES Puestos(id),
    estado VARCHAR(20) CHECK (estado IN ('activo', 'inactivo', 'retirado')) DEFAULT 'activo'
);

CREATE TABLE Periodos (
    id INT PRIMARY KEY IDENTITY,
    fecha_inicio DATE NOT NULL,
    fecha_fin DATE NOT NULL
);

CREATE TABLE Pagos (
    id INT PRIMARY KEY IDENTITY,
    empleado_id INT FOREIGN KEY REFERENCES Empleados(id),
    periodo_id INT FOREIGN KEY REFERENCES Periodos(id),
    monto DECIMAL(10,2) NOT NULL,
    fecha_pago DATETIME DEFAULT GETDATE()
);

```
### 5. Auditoria y Logs

- **AuditoriaUsuarios**: Registro de autenticaciones (éxito o fallo).
- **AuditoriaAcciones**: Registra qué usuario realizó qué acción y en qué tabla.
- **AuditoriaCambios**: Guarda los cambios en los datos.

```sql
CREATE TABLE AuditoriaUsuarios (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT FOREIGN KEY REFERENCES Usuarios(id),
    fecha_hora DATETIME DEFAULT GETDATE(),
    resultado VARCHAR(20) CHECK (resultado IN ('exitoso', 'fallido')),
    ip_origen VARCHAR(50) NOT NULL
);

CREATE TABLE AuditoriaAcciones (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT FOREIGN KEY REFERENCES Usuarios(id),
    tabla VARCHAR(50) NOT NULL,
    accion VARCHAR(20) CHECK (accion IN ('leer', 'insertar', 'actualizar', 'eliminar')),
    fecha_hora DATETIME DEFAULT GETDATE(),
    detalle VARCHAR(MAX) NULL
);

CREATE TABLE AuditoriaCambios (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT FOREIGN KEY REFERENCES Usuarios(id),
    tabla VARCHAR(50) NOT NULL,
    registro_id INT NOT NULL,
    campo VARCHAR(100) NOT NULL,
    valor_anterior VARCHAR(MAX) NULL,
    valor_nuevo VARCHAR(MAX) NULL,
    fecha_hora DATETIME DEFAULT GETDATE()
);

```
## Diccionario de datos

| Tabla                 | Campo               | Tipo de Dato | Descripción                                           |
| --------------------- | ------------------- | ------------ | ----------------------------------------------------- |
| **Usuarios**          | id                  | INT (PK)     | Identificador único del usuario                       |
|                       | username            | VARCHAR(50)  | Nombre de usuario único                               |
|                       | email               | VARCHAR(100) | Correo electrónico                                    |
|                       | password_hash       | VARCHAR(255) | Contraseña encriptada                                 |
|                       | estado              | VARCHAR(20)  | Estado del usuario (activo, inactivo, bloqueado)      |
| **Roles**             | id                  | INT (PK)     | Identificador único del rol                           |
|                       | nombre              | VARCHAR(50)  | Nombre del rol                                        |
| **Permisos**          | id                  | INT (PK)     | Identificador único del permiso                       |
|                       | rol_id              | INT (FK)     | Relación con tabla Roles                              |
|                       | tabla               | VARCHAR(50)  | Tabla a la que aplica el permiso                      |
|                       | columnas_permitidas | VARCHAR(MAX) | Lista de columnas accesibles                          |
|                       | puede_leer          | BIT          | Permiso de lectura                                    |
|                       | puede_insertar      | BIT          | Permiso de inserción                                  |
|                       | puede_actualizar    | BIT          | Permiso de actualización                              |
|                       | puede_eliminar      | BIT          | Permiso de eliminación                                |
| **AuditoriaUsuarios** | usuario_id          | INT (FK)     | Usuario autenticado                                   |
|                       | fecha_hora          | DATETIME     | Momento de autenticación                              |
|                       | resultado           | VARCHAR(20)  | Si la autenticación fue exitosa o fallida             |
| **AuditoriaAcciones** | usuario_id          | INT (FK)     | Usuario que realizó la acción                         |
|                       | tabla               | VARCHAR(50)  | Tabla sobre la que se realizó la acción               |
|                       | accion              | VARCHAR(20)  | Tipo de acción (leer, insertar, actualizar, eliminar) |
| **AuditoriaCambios**  | usuario_id          | INT (FK)     | Usuario que realizó el cambio                         |
|                       | tabla               | VARCHAR(50)  | Tabla afectada                                        |
|                       | campo               | VARCHAR(100) | Campo modificado                                      |
|                       | valor_anterior      | VARCHAR(MAX) | Valor antes del cambio                                |
|                       | valor_nuevo         | VARCHAR(MAX) | Valor después del cambio                              |
