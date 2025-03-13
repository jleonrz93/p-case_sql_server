# Arquitectura General del Sistema

**SGE**: Sistema de Gestión Empresarial.

El sistema se divide en dos grandes partes:

1. **Base de datos en SQL Server** 
	En donde se implementa la lógica de permisos, consultas y datos del sistema.
2. **API con Django Rest Framework**
	Expone los datos a los clientes (usuarios, sistemas externos), pero NO maneja la lógica de los permisos

## Estructura general
### Base de datos en SQL Server

- Contendrá las tablas correspondientes al *sistema de nomina* como: empleados, pagos, departamentos, etc.
- Implementa la *lógica de permisos* mediante *vistas, procedimientos almacenados y roles de usuario, DCL en SQL Server* 
- Define una *estructura de permisos* a nivel de:
	- Tablas: un usuario puede o no acceder a ciertas tablas.
	- Columnas: un usuario puede o no ver ciertos atributos.
	- Registros: un usuario solo puede ver ciertos registros dentro de una tabla.

### API en Django Rest Framework

- Solo se conectará con la base de datos de SQL Server.
- No manejara permisos en la aplicación (solo los consumirá desde SQL Server).
- Utilizará *Viewsets* para exponer los endpoints de la API.
- Implementa autenticación y autorización básica para determinar el usuario que hace las consultas.

## Flujo de Interacción 

De una manera muy amplia el flujo de interacción del sistema será el siguiente:

1. **Autenticación del Usuario**:
	La API recibe una solicitud y autentica al usuario.
2. **Consulta de permisos**
	La API ejecuta una vista o procedimiento almacenado en SQL Server, que retorna solo los datos a los que el usuario tiene acceso.
3. **Extracción de datos**
	La base de datos realiza las validaciones de restricción de permisos y, opera sobre los registros, columnas o tablas con acceso. El resultado lo retorna a la API.
4. **Devolución de datos**
	La API devuelve la información y la entrega al usuario.

![Arqui-Flujo de Interacción](attachments/architecture_dm.svg)
**Algunas consideraciones**
1. Al crear un usuario en la base de datos del sistema (SGE), un **trigger** genera automáticamente un registro en la tabla de usuarios de la base de datos de la API (API), incluyendo algunos de sus atributos.

2. La API contará con su propia base de datos para gestionar la autenticación, lo que permitirá aislarla y proteger los datos almacenados en SGE.

3. La API se autenticará en SQL Server utilizando un único usuario, pero siempre enviará el `us_id`. De esta forma, SQL Server podrá aplicar restricciones a nivel de tablas, columnas y registros según corresponda.


