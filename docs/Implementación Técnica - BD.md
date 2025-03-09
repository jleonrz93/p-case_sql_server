# Implementación Técnica - BD
## Base de datos (SQL Server)

Se cuenta con las siguientes tablas:

### 1. Usuarios y Roles

```sql
CREATE TABLE Usuarios (
    id INT PRIMARY KEY IDENTITY,
    username VARCHAR(50) UNIQUE NOT NULL,
    password_hash VARCHAR(255) NOT NULL
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
    puede_leer BIT DEFAULT 0,
    puede_escribir BIT DEFAULT 0
);

```
### 3. Restricción por permisos
```sql
CREATE TABLE PermisosRegistros (
    id INT PRIMARY KEY IDENTITY,
    usuario_id INT FOREIGN KEY REFERENCES Usuarios(id),
    tabla VARCHAR(50) NOT NULL,
    registro_id INT NOT NULL
);
```


