# Documentación de la Base de datos SCPNOM

**Autor:** jleonrz93  
**Fecha de actualización:** 12 de marzo de 2025  


**Tabla de Contenido**


## Introducción

SCPNOM es el módulo de nómina y el sistema de permisos granular dentro del **Sistema de Gestión Empresarial (SGE)**. Se encarga de gestionar empleados, pagos y departamentos, implementando reglas de acceso a los datos según permisos de usuario en SQL Server.

También incorpora auditoria sobre las acciones realizadas en la base de datos, y la implementación de la lógica de negocio mediante disparadores (Triggers) y Procedimientos Almacenados.

## Diagrama de la base de datos

A continuación el diagrama relacional de la base de datos SCPNOM v1.0.0

![Diagrama BD- SCPNOM v1.0.0](attachments/mer_sgcnom_v1.svg)

## Instalación

- Para crear la base de datos y todas las tablas, relaciones, índices use el archivo: [Crear Base de dato SCPNOM v1.0.0](../sql/scpnom_100_db.sql).
- Si desee incorporar la información metadata (descripción de tablas y atributos) utilice el archivo [Crear Metadata SCPNOM v1.0.0](../sql/scpnom_100_metadata.sql).
- Para contar con algunos registros de pruebas ejecute los `INSERT` que se encuentran en [Insert de prueba SCPNOM v1.0.0](../sql/scpnom_100_insert.sql).
## Estructuras de las tablas

Lo que se muestra a continuación es el contenido generado desde la metadata y directamente desde el motor de base de datos.
### Tablas

| Tabla                 | Descripción                                                                                 |
| --------------------- | ------------------------------------------------------------------------------------------- |
| ActionTypes           | Tipos de acciones para el log de acciones                                                   |
| Arl                   | Registro de entidades ARL                                                                   |
| ArlTable              | Define las reglas de liquidación para ARL                                                   |
| Caja                  | Registro de Cajas de Compensación                                                           |
| Cesantias             | Registro de Cesantías                                                                       |
| Contracts             | Contratos realizados a empleados                                                            |
| ContractType          | Almacena los Tipos de Contrato                                                              |
| Deductions            | Detalle de todos los conceptos deducidos                                                    |
| Departments           | Almacena los departamentos, áreas de la empresa                                             |
| Earnings              | Detalle de todos los conceptos devengados - Detalle de la Nómina                            |
| EmployeePosition      | Relaciona los cargos que un empleado tuvo o tiene                                           |
| Employees             | Información de los empleados / usuarios                                                     |
| Eps                   | Registros de entidades EPS                                                                  |
| IdentificationType    | Almacena los tipos de identificación para empleados                                         |
| LogActions            | Log de acciones, procedimientos, triggers, permisos, ...                                    |
| LogLogins             | Log de los intentos de inicio de sesión                                                     |
| LogSQL                | Log de sentencias SQL ejecutas sobre la base de datos                                       |
| PayrollParameters     | Almacena los conceptos de devengados y deducciones de la nómina y valores definidos por ley |
| PayrollParametersType | Conceptos / Detalles / Parámetros para liquidación de la nómina                             |
| PayrollPayment        | Nóminas liquidadas a los empleados                                                          |
| PayrollPeriod         | Definición de periodos para liquidación de nómina                                           |
| PayrollProvisioning   | Registra el detalle de Aprovisionamiento generado                                           |
| PayrollStatus         | Estados de la nómina                                                                        |
| PayrollSummary        | Resumen de la nómina generada por periodo                                                   |
| Pension               | Registro de entidad de Pensión                                                              |
| PensionSolidarityFund | Almacena la tabla para los cálculos de Fondo de Solidaridad Pensional                       |
| PermissionsType       | Tipos de permisos que se pueden otorgar en las tablas y en la base de datos                 |
| Positions             | Almacena los cargos de la empresa, relacionado con Departamento                             |
| PositionStatus        | Estados de un cargo para un empleado                                                        |
| RolePermissions       | Almacena los permisos para las tablas por roles                                             |
| UserPermissions       | Almacena los permisos para las tablas por usuarios                                          |
| UserRoles             | Roles, tipos de usuarios en el sistema para el control de permisos                          |
| UserStatus            | Almacena los estados que puede tener un usuario, empleado en el sistema                     |
| WithholdingTax        | Almacena la tabla para los cálculos de UVT para la retención en la fuente                   |
### Diccionario de datos
| Tabla | Campo | Tipo de Dato | Tamaño | Nulo | Descripción |
| ----- | ----- | ------------ | ------ | ---- | ----------- |
|ActionTypes|ActionTypeId|bigint|8|NO|Identificador único para el tipo de acción|
|ActionTypes|AtName|varchar|100|NO|Definición del tipo de acción posible en la base de datos|
|Arl|ArlId|bigint|8|NO|Identificador único de ARL|
|Arl|ArName|varchar|50|NO|Nombre de entidades ARL|
|ArlTable|AtId|bigint|8|NO|Identificador único para regla de liquidación ARL|
|ArlTable|AtYear|varchar|4|NO|Año en que aplica la regla|
|ArlTable|AtRisk|varchar|50|NO|Tipo / Riesgo de ARL|
|ArlTable|AtAmount|decimal|5|NO|Tarifa / Porcentaje de cobro|
|Caja|CajaId|bigint|8|NO|Identificador único de tipo de Caja de Compensación|
|Caja|CjName|varchar|50|NO|Nombre entidad de Caja de Compensación|
|Cesantias|CesantiasId|bigint|8|NO|Identificador único de tipo de Cesantías|
|Cesantias|CsName|varchar|50|NO|Nombre de entidad de Cesantías|
|Contracts|ContractsId|bigint|8|NO|Identificador único de Contrato realizado|
|Contracts|CoContractTypeId|int|4|NO|Relación - Identificador del tipo de contrato|
|Contracts|CoEmployeeId|bigint|8|NO|Relación - Identificador del empleado|
|Contracts|CoEmployeePositionId|bigint|8|NO|Relación - Cargo asociado al contrato|
|Contracts|CoStartDate|date|3|NO|Fecha de inicio del contrato|
|Contracts|CoEndDate|date|3|SI|Fecha de finalización del contrato|
|ContractType|ContractTypeId|int|4|NO|Identificador único de tipo de Contrato|
|ContractType|CtName|varchar|50|NO|Tipo de Contrato|
|Deductions|DeductionsId|bigint|8|NO|Identificador único de concepto devengado|
|Deductions|DeParametersId|bigint|8|NO|Relación - Identificador del concepto deducido|
|Deductions|DeEmployeeId|bigint|8|NO|Relación - Identificador del empleado|
|Deductions|DePaymentId|bigint|8|NO|Relación - Identificador de la nomina liquidada|
|Deductions|DePeriodId|bigint|8|NO|Periodo en la que aplica la deducción|
|Deductions|DeAmount|decimal|9|NO|Monto del concepto deducido|
|Departments|DepartmentId|int|4|NO|Identificador único del departamento|
|Departments|DeName|varchar|100|NO|Departamento o área de la empresa|
|Earnings|EarningsId|bigint|8|NO|Identificador único para concepto devengado por el empleado|
|Earnings|EaParametersId|bigint|8|NO|Relación - Identificador del concepto devengado|
|Earnings|EaEmployeeId|bigint|8|NO|Relación - Identificador del usuario|
|Earnings|EaPaymentId|bigint|8|NO|Relación - Identificador de la nomina liquidada|
|Earnings|EaPeriodId|bigint|8|NO|Periodo en el se devenga el concepto|
|Earnings|EaHours|int|4|SI|Horas de trabajo (trabajo - extras)|
|Earnings|EaAmount|decimal|9|NO|Monto del concepto devengado|
|EmployeePosition|EmployeePositionId|bigint|8|NO|Identificador único para cargo del empleado|
|EmployeePosition|EpPositionId|int|4|NO|Relación - Identificador del Cargo|
|EmployeePosition|EpEmployeeId|bigint|8|NO|Relación - Identificador del Usuario|
|EmployeePosition|EpStartDate|date|3|NO|Fecha de Inicio en la que aplica el cargo|
|EmployeePosition|EpEndDate|date|3|SI|Fecha de finalización en la que aplico el cargo - Si es vació es el cargo actual|
|EmployeePosition|EpCurrentSalary|decimal|9|NO|Sueldo base que devengada en el cargo|
|EmployeePosition|EpState|int|4|NO|Estado actual de dicho cargo|
|Employees|EmployeeId|bigint|8|NO|Identificador único de usuario|
|Employees|EmIdentificationType|int|4|NO|Relación - Identificador del tipo de identificación|
|Employees|EmIdentification|varchar|10|NO|No. de identificación|
|Employees|EmName|varchar|100|NO|Nombre(s)|
|Employees|EmLastName|varchar|100|NO|Apellido(s)|
|Employees|EmEmail|varchar|255|NO|Correo electrónico|
|Employees|Emphone|varchar|20|SI|Teléfono - Celular|
|Employees|EmAddress|varchar|200|SI|Dirección de residencia|
|Employees|EmDateBrith|date|3|NO|Fecha de nacimiento|
|Employees|EmUsername|varchar|50|NO|USERNAME del Empleado - para login en el sistema|
|Employees|EmPassword|varchar|255|NO|PASSWORD del empelado - para login en el sistema|
|Employees|EmStatusId|int|4|NO|Relación - Identificador del estado del usuario|
|Employees|EmUserRoleId|int|4|NO|Relación - Identificador del rol asociado|
|Employees|EmCaja|bigint|8|SI|Relación - Identificador de entidad Caja de Compensación|
|Employees|EmArl|bigint|8|SI|Relación - Identificador de Entidad ARL|
|Employees|EmEps|bigint|8|SI|Relación - Identificador de entidad EPS|
|Employees|EmPension|bigint|8|SI|Relación - Identificador de entidad Pensión|
|Employees|EmCesantias|bigint|8|SI|Relación - Identificador de entidad Cesantías|
|Eps|EpsId|bigint|8|NO|Identificador único de EPS|
|Eps|EpName|varchar|50|NO|Nombre de la EPS|
|IdentificationType|IdentificaciónTypeId|int|4|NO|Identificador único de tipo de identificación|
|IdentificationType|IdType|varchar|40|NO|Tipo de Identificación|
|LogActions|LaId|bigint|8|NO|Identificador único de registro de log acción|
|LogActions|LaUserId|bigint|8|NO|Identificador del usuario que ejecuto la acción|
|LogActions|LaUsername|varchar|50|NO|Nombre de usuario que ejecuto la acción|
|LogActions|LaDateTime|datetime|8|NO|Fecha y Hora en la que ocurrió el evento|
|LogActions|LaActionTypeId|bigint|8|NO|Relación - Define el tipo de acción que se ejecuto|
|LogActions|LaParameters|varchar|200|SI|Parámetros usados en la acción - Si Aplica|
|LogActions|LaAddInfo|varchar|-1|SI|Información adicional sobre la acción ejecutada|
|LogLogins|LoginId|bigint|8|NO|Identificador único para log de intento de login|
|LogLogins|LiUserId|bigint|8|NO|Identificador del usuario que intento el login - Si aplica|
|LogLogins|LiUsername|varchar|50|NO|Nombre de usuario utilizado en el intento de login|
|LogLogins|LiDateTime|datetime|8|NO|Fecha y hora en la que se registro el evento|
|LogLogins|LiSuccess|bit|1|NO|"Indica si el login fue exitoso o fallido ""Success - Failure"""|
|LogLogins|LiIP|varchar|50|SI|Dirección IP del cliente|
|LogLogins|LiUserAgent|varchar|255|SI|Agente identificado (navegador - sistema operativo - otros)|
|LogSQL|LSqlId|bigint|8|NO|Identificador único para log de SQL|
|LogSQL|LsUserId|bigint|8|NO|Identificador del usuario que ejecuto la sentencia|
|LogSQL|LsUsername|varchar|50|NO|Nombre de usuario que ejecuto la consulta|
|LogSQL|LsDateTime|datetime|8|NO|Fecha y hora en la que se ejecuto la acción|
|LogSQL|LsSQLStatement|varchar|-1|SI|Sentencia SQL ejecutada|
|PayrollParameters|ParameterId|bigint|8|NO|Identificador único para en concepto de liquidación de nomina|
|PayrollParameters|PeParametersTypeId|bigint|8|NO|Relación - Identificador del tipo de concepto / parámetro|
|PayrollParameters|PeConcept|varchar|50|NO|Definición del concepto para liquidación de nomina|
|PayrollParameters|PeValue|decimal|9|SI|Valor / Porcentaje / Tarifa del concepto - Si aplica|
|PayrollParameters|PeUnit|varchar|4|SI|Unidad del valor (COP, %, HR)|
|PayrollParameters|PeStatus|bit|1|NO|Estado del concepto. Activo - Inactivo|
|PayrollParameters|PeYear|varchar|4|NO|Año en el que aplica el concepto|
|PayrollParameters|PeAssumedBy|varchar|10|NO|"Quien asume el pago del concepto / Responsable (""Trabajador"", ""Empleador"")"|
|PayrollParametersType|ParametersTypeId|bigint|8|NO|Identificador único para el parámetro de nomina|
|PayrollParametersType|PtName|varchar|50|NO|Definición del parámetro|
|PayrollPayment|PaymentId|bigint|8|NO|Identificador único de de nomina liquidada|
|PayrollPayment|PyEmployeeId|bigint|8|NO|Relación - Identificador del empleado|
|PayrollPayment|PyPeriodId|bigint|8|NO|Relación - Identificador del periodo|
|PayrollPayment|PySalaryBase|decimal|9|NO|Salario Base de la nomina|
|PayrollPayment|PySalaryEarned|decimal|9|NO|Salario Devengado (Devengado - Aux. Transporte)|
|PayrollPayment|PySalaryNet|decimal|9|NO|Salario Neto (Total pagado)|
|PayrollPayment|PyTransportAux|decimal|9|NO|Monto de auxilio de transporte|
|PayrollPayment|PyTotalEarnings|decimal|9|NO|Total / Suma conceptos devengados al empleado|
|PayrollPayment|PyTotalDeductions|decimal|9|NO|Total / Suma de conceptos deducidos al empleado|
|PayrollPayment|PyTotalProvisioned|decimal|9|NO|Total / Suma aprovisionado por el empleador|
|PayrollPayment|PyAmount|decimal|9|NO|Total pagado por el empleador por la nomina|
|PayrollPayment|PrDateSettlement|date|3|SI|Fecha de liquidación de la nomina|
|PayrollPayment|PyPaymentVoucher|varchar|100|SI|No. de Comprobante de Pago|
|PayrollPayment|PyDateVoucher|date|3|SI|Fecha del Comprobante de Pago|
|PayrollPayment|PyPayrollStatusId|bigint|8|NO|Relación - Estado de liquidación de la nomina|
|PayrollPeriod|PeriodId|bigint|8|NO|Identificador único para el periodo|
|PayrollPeriod|PrYear|varchar|4|NO|Año que aplica el periodo|
|PayrollPeriod|PrMont|varchar|2|NO|Mes que aplica el periodo|
|PayrollPeriod|PrStartDate|date|3|NO|Fecha de inicio que aplica|
|PayrollPeriod|PrEndDate|date|3|NO|Fecha de finalización del periodo|
|PayrollProvisioning|ProvisioningId|bigint|8|NO|Identificador único para detalle de aprovisionamiento|
|PayrollProvisioning|PgPaymentId|bigint|8|NO|Relación - Identificador de la nomina liquidada|
|PayrollProvisioning|PgParametersId|bigint|8|NO|Relación - Identificador de Concepto aprovisionado|
|PayrollProvisioning|PgAmount|decimal|9|NO|Monto del concepto|
|PayrollProvisioning|PgSena|decimal|9|NO|Monto calculado para pago SENA|
|PayrollProvisioning|PgICBF|decimal|9|NO|Monto calculado para pago ICBF|
|PayrollProvisioning|PgCaja|decimal|9|NO|Monto calculado para pago Caja de Compensación|
|PayrollProvisioning|PgSalud|decimal|9|NO|Monto pago Salud por parte del empleador|
|PayrollProvisioning|PgPension|decimal|9|NO|Monto pago Pensión por parte del empleador|
|PayrollProvisioning|PgArl|decimal|9|NO|Monto de pago para ARL|
|PayrollProvisioning|PgPrima|decimal|9|NO|Monto aprovisionado para Prima de servicios|
|PayrollProvisioning|PgCesantias|decimal|9|NO|Monto aprovisionado para Cesantías|
|PayrollProvisioning|PgIntCesantias|decimal|9|NO|Monto Interés sobre las Cesantías|
|PayrollProvisioning|PgVacaciones|decimal|9|NO|Monto aprovisionado para Vacaciones|
|PayrollStatus|PayrollStatusId|bigint|8|NO|Identificador único para estado de liquidación de la nomina|
|PayrollStatus|PsName|varchar|50|NO|Definición estado de nomina|
|PayrollStatus|PsDescription|varchar|200|SI|Definición del estado de liquidación de una nomina|
|PayrollSummary|SummaryId|bigint|8|NO|Identificador único de resumen de nomina|
|PayrollSummary|SmPeriodId|bigint|8|NO|Relación - Identificador del periodo liquidado|
|PayrollSummary|SmSalaryBase|decimal|9|NO|Total de salario base|
|PayrollSummary|SmSalaryEarned|decimal|9|NO|Total de salario devengado|
|PayrollSummary|SmSalaryNet|decimal|9|NO|Total de salario Neto|
|PayrollSummary|SmEarnings|decimal|9|NO|Total Devengado|
|PayrollSummary|SmDeductions|decimal|9|NO|Total Deducido|
|PayrollSummary|SmProvisioned|decimal|9|NO|Total Aprovisionado|
|PayrollSummary|SmPayrollPayment|decimal|13|NO|Total pagado por la nomina|
|Pension|PensionId|bigint|8|NO|Identificador único de pensión|
|Pension|PnName|varchar|50|NO|Nombre de la entidad de Pensión|
|PensionSolidarityFund|FundId|bigint|8|NO|Identificador único para regla de Fond Solidario|
|PensionSolidarityFund|FuInconeFrom|int|4|NO|Rango mayor o igual a...|
|PensionSolidarityFund|FuInconeTo|int|4|NO|Rango menor a...|
|PensionSolidarityFund|FuRate|decimal|5|NO|Porcentaje / Tarifa de descuento|
|PensionSolidarityFund|FuYear|varchar|4|NO|Año en el que aplica la regla|
|PermissionsType|PermissionTypeId|int|4|NO|Identificador único para tipo de permiso|
|PermissionsType|PtName|varchar|50|NO|Tipo de permiso del sistema|
|Positions|PositionId|int|4|NO|Identificador único para un cargo|
|Positions|PoName|varchar|100|NO|Cargos de la empresa|
|Positions|PoDepartmentID|int|4|NO|Relación con Departamentos de la empresa|
|PositionStatus|PositionStatusId|bigint|8|NO|Identificador único para el estado de un cargo|
|PositionStatus|PpStatus|varchar|20|NO|Definición del estado que puede adoptar un cargo|
|RolePermissions|RolePermissionsId|bigint|8|NO|Identificador único para permiso por rol|
|RolePermissions|RpRoleId|int|4|NO|Relación con tabla roles - Indica el rol|
|RolePermissions|RpTable|varchar|100|NO|Nombre de la tabla de la base de datos que aplica la regla|
|RolePermissions|RpTypeId|int|4|NO|Relación - Tipo de permiso que aplica - Otorga|
|RolePermissions|RpActive|bit|1|NO|Si el permiso / regla se encuentra activa|
|UserPermissions|UserPermissionsId|bigint|8|NO|Identificador único de regla de permiso por usuario|
|UserPermissions|UrEmployeeId|bigint|8|NO|Relación - Id del usuario al cual aplica el permiso|
|UserPermissions|UrTable|varchar|100|NO|Nombre de la tabla de la base de datos que aplica el permiso|
|UserPermissions|UrTypeId|int|4|NO|Relación - Tipo de permiso que aplica sobre la tabla - Otorga|
|UserPermissions|UrActive|bit|1|NO|Indica si el permiso / regla se encuentra activa|
|UserRoles|RoleId|int|4|NO|Identificador único para rol de usuario|
|UserRoles|RlName|varchar|50|NO|Definición del rol|
|UserStatus|StatusId|int|4|NO|Identificador único de tipo de estado usuario|
|UserStatus|StName|varchar|20|NO|Estado del Usuario en el Sistema|
|WithholdingTax|TaId|bigint|8|NO|Identificador único para regla de ReteFuente|
|WithholdingTax|TaYear|varchar|4|NO|Año en el que aplica la regla|
|WithholdingTax|TaIncomeFrom|int|4|NO|Rango mayor que...|
|WithholdingTax|TaIncomeTo|int|4|NO|Rango menor o igual que...|
|WithholdingTax|TaRate|decimal|5|NO|Tarifa / Porcentaje de descuento|
|WithholdingTax|TaUVTDiscount|int|4|SI|UVT Exentos|
|WithholdingTax|TaUVTIncrease|int|4|SI|UVT Incremento|
## Relaciones

Estas son las relaciones (claves foráneas) entre las tablas.

| Nombre Foraign Key | Tabla | Columna | Tabla de Referencia | Columna de Referencia |
| ------------------ | ----- | ------- | ------------------- | --------------------- |
|FK_ContractPosition|Contracts|CoEmployeePositionId|EmployeePosition|EmployeePositionId|
|FK_EmployeeContracts|Contracts|CoEmployeeId|Employees|EmployeeId|
|FK_ContractType|Contracts|CoContractTypeId|ContractType|ContractTypeId|
|FK_EmployeeDeductions|Deductions|DeEmployeeId|Employees|EmployeeId|
|FK_PayrollDeductions|Deductions|DePaymentId|PayrollPayment|PaymentId|
|FK_PeriodDeductions|Deductions|DePeriodId|PayrollPeriod|PeriodId|
|FK_ParametersDeductions|Deductions|DeParametersId|PayrollParameters|ParameterId|
|FK_ParametersEarnings|Earnings|EaParametersId|PayrollParameters|ParameterId|
|FK_PeriodEarnigs|Earnings|EaPeriodId|PayrollPeriod|PeriodId|
|FK_PayrollEarnings|Earnings|EaPaymentId|PayrollPayment|PaymentId|
|FK_EmployeeEarnings|Earnings|EaEmployeeId|Employees|EmployeeId|
|FK_EmployeePosition_Employee|EmployeePosition|EpEmployeeId|Employees|EmployeeId|
|FK_EmployeePosition|EmployeePosition|EpPositionId|Positions|PositionId|
|FK_EmployeeIdentification|Employees|EmIdentificationType|IdentificationType|IdentificaciónTypeId|
|FK_EmployeeStatus|Employees|EmStatusId|UserStatus|StatusId|
|FK_EmployeeEps|Employees|EmEps|Eps|EpsId|
|FK_EmployeeArl|Employees|EmArl|Arl|ArlId|
|FK_EmployeePension|Employees|EmPension|Pension|PensionId|
|FK_EmployeeCaja|Employees|EmCaja|Caja|CajaId|
|FK_EmployeeCesantias|Employees|EmCesantias|Cesantias|CesantiasId|
|FK_EmployeeRole|Employees|EmUserRoleId|UserRoles|RoleId|
|FK_LogActionType|LogActions|LaActionTypeId|ActionTypes|ActionTypeId|
|FK_PayrollParameters|PayrollParameters|PeParametersTypeId|PayrollParametersType|ParametersTypeId|
|FK_PeriodPayroll|PayrollPayment|PyPeriodId|PayrollPeriod|PeriodId|
|FK_StatusPayroll|PayrollPayment|PyPayrollStatusId|PayrollStatus|PayrollStatusId|
|FK_EmployeePayroll|PayrollPayment|PyEmployeeId|Employees|EmployeeId|
|FK_ProvisioningPayment|PayrollProvisioning|PgPaymentId|PayrollPayment|PaymentId|
|FK_ProvisioningParamenters|PayrollProvisioning|PgParametersId|PayrollParameters|ParameterId|
|FK_PeriodSummary|PayrollSummary|SmPeriodId|PayrollPeriod|PeriodId|
|FK_PositionDepartments|Positions|PoDepartmentID|Departments|DepartmentId|
|FK_TypePermissions|RolePermissions|RpTypeId|PermissionsType|PermissionTypeId|
|FK_RolePermissions|RolePermissions|RpRoleId|UserRoles|RoleId|
|FK_UserPermissions|UserPermissions|UrTypeId|PermissionsType|PermissionTypeId|
|FK_UserPermissions_Employee|UserPermissions|UrEmployeeId|Employees|EmployeeId|

## Índices

Estos son los índices para la mejora de búsquedas y rendimiento de la base de datos

| Tabla                 | Nombre Índice                  | Tipo Índice  | Columnas             |
| --------------------- | ------------------------------ | ------------ | -------------------- |
| ActionTypes           | PK__ActionTy__62FE4C64AC99E79F | CLUSTERED    | ActionTypeId         |
| ActionTypes           | UQ_ActionTypes                 | NONCLUSTERED | AtName               |
| Arl                   | ID_ArlName                     | NONCLUSTERED | ArName               |
| Arl                   | PK__Arl__3DB78AEE882312D5      | CLUSTERED    | ArlId                |
| Arl                   | UQ_Arl                         | NONCLUSTERED | ArName               |
| ArlTable              | PK__ArlTable__053114B764218096 | CLUSTERED    | AtId                 |
| Caja                  | ID_CajaName                    | NONCLUSTERED | CjName               |
| Caja                  | PK__Caja__A74F8707A6A55D86     | CLUSTERED    | CajaId               |
| Caja                  | UQ_Caja                        | NONCLUSTERED | CjName               |
| Cesantias             | ID_CsantiasName                | NONCLUSTERED | CsName               |
| Cesantias             | PK__Cesantia__3E02F4EF8FA6EFF5 | CLUSTERED    | CesantiasId          |
| Cesantias             | UQ_Cesantias                   | NONCLUSTERED | CsName               |
| Contracts             | PK__Contract__062F14BE31C528D8 | CLUSTERED    | ContractsId          |
| ContractType          | PK__Contract__68A61565E8790883 | CLUSTERED    | ContractTypeId       |
| ContractType          | UQ_ContractType                | NONCLUSTERED | CtName               |
| Deductions            | PK__Deductio__722E2910D3A5876C | CLUSTERED    | DeductionsId         |
| Departments           | PK__Departme__B2079BEDC285A010 | CLUSTERED    | DepartmentId         |
| Departments           | UQ_DepartmentName              | NONCLUSTERED | DeName               |
| Earnings              | PK__Earnings__79934E4FB639807B | CLUSTERED    | EarningsId           |
| EmployeePosition      | PK__Employee__6FDE906064B51473 | CLUSTERED    | EmployeePositionId   |
| Employees             | ID_Employees_Identification    | NONCLUSTERED | EmIdentification     |
| Employees             | ID_Employees_Username          | NONCLUSTERED | EmUsername           |
| Employees             | PK__Employee__7AD04F112BF6A6BF | CLUSTERED    | EmployeeId           |
| Employees             | UQ__Employee__5AC842A9C8253531 | NONCLUSTERED | EmEmail              |
| Employees             | UQ_IdentificarionEmployees     | NONCLUSTERED | EmIdentification     |
| Employees             | UQ_UsernameEmployees           | NONCLUSTERED | EmUsername           |
| Eps                   | ID_EpsName                     | NONCLUSTERED | EpName               |
| Eps                   | PK__Eps__0DB76070E9F8C90A      | CLUSTERED    | EpsId                |
| Eps                   | UQ_Eps                         | NONCLUSTERED | EpName               |
| IdentificationType    | PK__Identifi__07E77A779810BDC0 | CLUSTERED    | IdentificaciónTypeId |
| IdentificationType    | UQ_IdentificationType          | NONCLUSTERED | IdType               |
| LogActions            | ID_LogAction_UserId            | NONCLUSTERED | LaUserId             |
| LogActions            | ID_LogAction_Username          | NONCLUSTERED | LaUsername           |
| LogActions            | PK__LogActio__40B3EC2588A912D9 | CLUSTERED    | LaId                 |
| LogLogins             | ID_LogLogins_UserId            | NONCLUSTERED | LiUserId             |
| LogLogins             | ID_LogLogins_Username          | NONCLUSTERED | LiUsername           |
| LogLogins             | PK__LogLogin__4DDA28188A00F43B | CLUSTERED    | LoginId              |
| LogSQL                | ID_LogSQL_UserId               | NONCLUSTERED | LsUserId             |
| LogSQL                | ID_LogSQL_Username             | NONCLUSTERED | LsUsername           |
| LogSQL                | PK__LogSQL__2B4DCE8D7EA4D911   | CLUSTERED    | LSqlId               |
| PayrollParameters     | ID_Payroll_Concept             | NONCLUSTERED | PeConcept            |
| PayrollParameters     | PK__PayrollP__F80C62775776C888 | CLUSTERED    | ParameterId          |
| PayrollParametersType | PK__PayrollP__7D37F3019BEB63AB | CLUSTERED    | ParametersTypeId     |
| PayrollParametersType | UQ_ParametersName              | NONCLUSTERED | PtName               |
| PayrollPayment        | PK__PayrollP__9B556A38C1098A71 | CLUSTERED    | PaymentId            |
| PayrollPayment        | UQ_PaymentVoucher              | NONCLUSTERED | PyPaymentVoucher     |
| PayrollPeriod         | ID_PayrollPeriod_YearMonth     | NONCLUSTERED | PrYear, PrMont       |
| PayrollPeriod         | PK__PayrollP__E521BB16BAB3B5A9 | CLUSTERED    | PeriodId             |
| PayrollPeriod         | UQ_PayrollPeriod_YearMonth     | NONCLUSTERED | PrYear, PrMont       |
| PayrollProvisioning   | PK__PayrollP__00F3151569F45CE0 | CLUSTERED    | ProvisioningId       |
| PayrollStatus         | PK__PayrollS__7C4A2E6B70DA3A90 | CLUSTERED    | PayrollStatusId      |
| PayrollStatus         | UQ_PayrollStatusId             | NONCLUSTERED | PsName               |
| PayrollSummary        | PK__PayrollS__DAB10E2F48D98937 | CLUSTERED    | SummaryId            |
| Pension               | ID_PensionName                 | NONCLUSTERED | PnName               |
| Pension               | PK__Pension__9C1B00B1B4B5790A  | CLUSTERED    | PensionId            |
| Pension               | UQ_Pension                     | NONCLUSTERED | PnName               |
| PensionSolidarityFund | PK__PensionS__830DFC5AABBA4BBF | CLUSTERED    | FundId               |
| PermissionsType       | PK__Permissi__53B420CFF2DD6313 | CLUSTERED    | PermissionTypeId     |
| PermissionsType       | UQ_PermissionsName             | NONCLUSTERED | PtName               |
| Positions             | PK__Position__60BB9A79D116F16B | CLUSTERED    | PositionId           |
| PositionStatus        | PK__Position__0E69A56188F79F2D | CLUSTERED    | PositionStatusId     |
| PositionStatus        | UQ_PositionStatus              | NONCLUSTERED | PpStatus             |
| RolePermissions       | IX_RolePermissionActive        | NONCLUSTERED | RpTable, RpTypeId    |
| RolePermissions       | PK__RolePerm__18B281E06A526972 | CLUSTERED    | RolePermissionsId    |
| UserPermissions       | IX_UserPermissionActive        | NONCLUSTERED | UrTable, UrTypeId    |
| UserPermissions       | PK__UserPerm__3E193113C09772A7 | CLUSTERED    | UserPermissionsId    |
| UserRoles             | ID_UserRoles                   | NONCLUSTERED | RlName               |
| UserRoles             | PK__UserRole__8AFACE1A71370F96 | CLUSTERED    | RoleId               |
| UserRoles             | UQ_RoleName                    | NONCLUSTERED | RlName               |
| UserStatus            | PK__UserStat__C8EE20638604024D | CLUSTERED    | StatusId             |
| UserStatus            | UQ_StatusName                  | NONCLUSTERED | StName               |
| WithholdingTax        | PK__Withhold__823303A03AAF302B | CLUSTERED    | TaId                 |

## Consideraciones de Seguridad

### Usuario `admin_bd`

El usuario `admin_bd` ha sido creado para administrar exclusivamente la base de datos `SCPNOM`. Este usuario tiene privilegios de administración dentro de la base de datos, pero no posee permisos a nivel del servidor ni acceso a otras bases de datos.

**Objeto**
* Garantiza que `admin_bd` pueda gestionar completamente la base de datos `SCPNOM` sin comprometer la seguridad del servidor o de otras bases de datos.
* Se crea desde el archivo de creación de bases de datos.
