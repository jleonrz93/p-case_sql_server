# State Codes - SCPNOM

| @StattusCode | @Message                                                                            | Generado               | Descripción                                                                       |
| ------------ | ----------------------------------------------------------------------------------- | ---------------------- | --------------------------------------------------------------------------------- |
| 100          | Tarea ejecutada sin novedades                                                       | ProcedimientoPrincipal | Se ejecuto tarea sin ninguna novedad                                              |
| 201          | Usuario no encontrado                                                               | Autenticación          | El `Username` no existe en el sistema (valor por defecto)                         |
| 202          | Contraseña incorrecta                                                               | Autenticación          | El usuario existe pero el `password` no es el correcto                            |
| 203          | Autenticación Exitosa                                                               | Autenticación          | El usuario fue logeado y se registro su sesión                                    |
| 301          | Error: No se pudo analizar los permisos para Username                               | Check Permisos         | No fue posible analizar los permisos con el Username actual                       |
| 302          | Permiso denegado. No tiene acceso a las siguientes tablas: `table1, table2, table3` | Check Permisos         | El usuario no tiene permisos sobre las tablas para ejecutar determinadas acciones |
| 303          | Permiso concedido para la operación.                                                | Check Permisos         | El usuario cuenta con los permisos necesarios para ejecutar la operación.         |
| 401          | Faltan los siguientes parámetros: `param1, param2, param3`                          | Procedimiento Vistas   | No se recibieron los parámetros requeridos para ejecutar el procedimiento         |
| 900          | Error desconocido                                                                   | Orquestador            | Error desconocido                                                                 |
| 901          | El procedimiento no existe                                                          | Orquestador            | El procedimiento solicitado no existe.                                            |
