
# Sistema de Gestión Empresarial

**Autor**: Jorge Leonardo Ruiz -jleonrz93
**Versión**: 1.0.0
**Fecha de creación**: 2025-03-09

El sistema es una **API RESTful** que sirve como capa de comunicación entre los clientes (aplicaciones web, móviles, u otros sistemas) y la base de datos **SQL Server**. Su principal función es **exponer endpoints para consulta, inserción, actualización y eliminación de datos**, garantizando autenticación, autorización y auditoría de cada acción.

La API se desarrolla en **Django REST Framework** ~~y se ejecuta dentro de un contenedor **Docker**~~. La autenticación se gestiona dentro de la API y los permisos sobre los datos son manejados directamente en SQL Server.
## Características Principales 

✅ **Autenticación y Autorización:**

- La API usa autenticación ~~basada en tokens o JWT~~.
- SQL Server controla permisos y auditoría de acceso a la información.

✅ **Gestión de Usuarios y Roles:**

- Los usuarios de la API se gestionan en su propia base de datos.
- SQL Server maneja permisos sobre los datos con base en `us_id` (ID del usuario).

✅ **Registro de Auditoría:**

- Se registra cada inicio de sesión (éxito o falla).
- Se auditan operaciones `INSERT`, `UPDATE`, `DELETE`, incluyendo cambios en los registros.
- Se guarda información sobre qué usuario accedió y qué datos consultó.

✅ **Sistema de Nómina:**

- Administración de empleados, pagos, departamentos y períodos de pago.

✅ **Seguridad:**

- Se evita exponer credenciales de SQL Server en la API.
- Se validan permisos en SQL Server ~~utilizando `SESSION_CONTEXT`~~.
- Se manejan logs y auditoría de acciones de los usuarios.

~~✅ **Despliegue en Docker:**~~

~~- API empaquetada en un contenedor Docker.~~
~~- Base de datos SQL Server puede estar en un contenedor separado o en un servidor externo.~~

## Estructura del proyecto

```bash
/c-case_sql_server
│── /app                     # Código fuente de la API
│── requirements.txt         # Dependencias del proyecto
│── README.md                # Documentación

```
## Instalación

### Requisitos


### Sincronizando


### Clonando el repositorio

**1. Clonar el repositorio**

```bash
`git clone `
```
**2. Configurar variables de entorno**

Editar las variables del proyecto correspondientes a la conexión con la base de datos.

## Documentación técnica

- Consulta la [Arquitectura General del Sistema](docs/Arquitectura%20General%20del%20Sistema.md). 
- Consulta la [Implementación Técnica de la Base de datos SGE](Doc_BD_SCPNOM.md).
- Consulta la [Implementación Técnica de la Base de datos API](docs/IT%20-%20BD%20API.md).
- Consulta la [Implementación Técnica de la API](docs/IT%20-%20BD%20API.md).

## Manuales de Usuario

- Consulta la [EndPoints - API Rest](docs/EndPoints%20-%20API%20Rest.md). 
