# Arquitectura General del Sistema

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
3. **Devolución de datos**
	La API devuelve la información y la entrega al usuario.

![Arqui-Flujo de Interacción](architecture_dm.svg)

