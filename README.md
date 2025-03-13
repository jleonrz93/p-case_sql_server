
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
│── /app                              # Código fuente de la API
│── /backup                           # backup de la aplicación
│── /docs                             # Documentación del sistema
│──── /Anexos                         # Documentos anexos del proyecto
│──── /Controllers                    # Documentación tecnica de los modulos principales de SQL Srv
│──── /Procedimientos                 # Documentación tecnica de los procedimientos de SQL Srv
│──── /Vistas                         # Documentación tecnica de las vistas de SQL Srv
│──── ArquitecturaGeneralSistema      # Doc. Técnico explicando diseño del sistema
│──── ArquitecturaPermisosLogica      # Doc. Técnico explicando la logica y control de permisos
│──── DocuBB_API                      # Doc. Técnico base de datos de la API
│──── DocuBB_SCPNOM                   # Doc. Técnico base de datos de la sistema SQL
│──── EndPonits_Listado               # Listado / Resumente de los EndPoints de la API
│──── StateCodes                      # Codigos de estado en respuesta a ejecutar procedimientos y EndPonts
│── /sql                              # Scripst SQL para creación, Insert, metadata
│── /test                             # Scripts - Code para pruebas
│── requirements.txt                  # Dependencias del proyecto
│── README.md                         # Leeme

```

## Diseño e Implementación del sistema

Se ha divido el diseño en varios módulos de tal forma que se pueda garantizar su mantenimiento y escalabilidad de la siguiente manera:

- **Control de autenticación**: encargado de todo el proceso de autenticación y validación del usuario en el sistema.
- **Control de Logs**: gestiona e implementa los registro de log en cuanto a inicio de sesión, actividades en el sistema y ejecución de sentencias SQL.
- **Control de Permisos**: gestiona los permisos en el sistema, valida que permisos tiene un usuario a nivel de tablas y registros.
- **Procedimiento Orquestador**: procedimiento principal en SQLServ, este es el que recibe todas las peticiones desde la API y maneja la lógica dentro de SQLSrv.

Si desea ampliar la información anterior diríjase a cada uno de los documentos correspondientes:

| Documento                 | Enlace                                                    |
| ------------------------- | --------------------------------------------------------- |
| Control de Autenticación  | [Ver aquí](docs/Controllers/Autenticacion_Control.md)     |
| Control de Permisos       | [Ver aquí](docs/Controllers/Permisos_Control.md)          |
| Control de Logs           | [Ver aquí](docs/Controllers/Log_Control.md)               |
| Procedimiento Orquestador | [Ver aquí](docs/Controllers/Procedimiento_Orquestador.md) |

## Instalación

### Requisitos


### Sincronizando


## Documentación técnica

- Consulta la [Arquitectura General del Sistema](docs/ArquitecturaGeneralSistema.md). 
- Consulta la [Arquitectura Lógica de Permisos y Negocio](docs/ArquitecturaPermisosLogica.md). 
- Consulta la [Implementación Técnica de la Base de datos SGE](DocuBD_SCPNOM.md).
- Consulta la [Implementación Técnica de la Base de datos API](DocuBD_API.md).

## Documentos de referencia

 - Consulta los estado y descripciones en respuesta a los procedimientos en [State Codes](docs/StateCodes.md).
 - Consulta el listado de EndPonts de la API [EndPoints Listado](docs/EndPoints_Listado.md).

## Elementos del sistema en SQLSrv

### Vistas

| Nombre                       | Documento                                            | Descripción                                                                                |
| ---------------------------- | ---------------------------------------------------- | ------------------------------------------------------------------------------------------ |
| `vw_EmployeeDetails`         | [Detalle](docs/Vistas/vw_EmployeeDetails.md)         | Centraliza y optimiza la consulta de información detallada sobre los empleados del sistema |
| `vw_UserPermissions_Details` | [Detalle](docs/Vistas/vw_UserPermissions_Details.md) | Proporciona una representación consolidada de los permisos asignados a cada usuario        |
| ``vw_UserPayroll`            | [Detalle](docs/Vistas/vw_UserPermissions_Details.md) | Muestra la información de nomina liquidada por usaurio.                                    |

### Procedimientos

| Nombre                  | Documento                                               | Descripción                                    |
| ----------------------- | ------------------------------------------------------- | ---------------------------------------------- |
| `sp_GetUserPermissions` | [Detalle](docs/Procedimientos/sp_GetUserPermissions.md) | Obtiene los permisos de un usuario determinado |
| `sp_SyncSystemTables`   | [Detalle](docs/Procedimientos/sp_SyncSystemTables.md)   | Permite poblar las tablas del sistema          |
| `sp_GetEmployeeDetalis` | [Detalle](docs/Procedimientos/sp_GetEmployeeDetalis.md) | Obtiene los datos de un empleado               |

### Disparadores

- Los puede encontrar dentro del documento detalle relacionados a la Diseño e Implementación del sistema.