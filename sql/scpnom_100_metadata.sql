-- Tabla: Contract Types

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los Tipos de Contrato', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ContractType';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de tipo de Contrato', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ContractType', 
    @level2type = 'COLUMN', @level2name = 'ContractTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tipo de Contrato', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ContractType', 
    @level2type = 'COLUMN', @level2name = 'CtName';
GO


-- Tabla: Departments

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los departamentos, áreas de la empresa', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Departments';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único del departamento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Departments', 
    @level2type = 'COLUMN', @level2name = 'DepartmentId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Departamento o área de la empresa', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Departments', 
    @level2type = 'COLUMN', @level2name = 'DeName';
GO


-- Tabla: Positions

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los cargos de la empresa, relacionado con Departamento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Positions';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para un cargo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Positions', 
    @level2type = 'COLUMN', @level2name = 'PositionId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Cargos de la empresa', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Positions', 
    @level2type = 'COLUMN', @level2name = 'PoName';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación con Departamentos de la empresa', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Positions', 
    @level2type = 'COLUMN', @level2name = 'PoDepartmentID';
GO


-- Tabla: IdentificationType

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los tipos de identificación para empleados', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'IdentificationType';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de tipo de identificación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'IdentificationType', 
    @level2type = 'COLUMN', @level2name = 'IdentificaciónTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tipo de Identificación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'IdentificationType', 
    @level2type = 'COLUMN', @level2name = 'IdType';
GO


-- Tabla: UserStatus

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los estados que puede tener un usuario, empleado en el sistema', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserStatus';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de tipo de estado usuario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserStatus', 
    @level2type = 'COLUMN', @level2name = 'StatusId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Estado del Usuario en el Sistema', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserStatus', 
    @level2type = 'COLUMN', @level2name = 'StName';
GO


-- Tabla: PermissionsType

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tipos de permisos que se pueden otorgar en las tablas y en la base de datos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PermissionsType';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para tipo de permiso', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PermissionsType', 
    @level2type = 'COLUMN', @level2name = 'PermissionTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tipo de permiso del sistema', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PermissionsType', 
    @level2type = 'COLUMN', @level2name = 'PtName';
GO

-- Tabla: ArlTable

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Define las reglas de liquidación para ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ArlTable';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para regla de liquidación ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ArlTable', 
    @level2type = 'COLUMN', @level2name = 'AtId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Año en que aplica la regla', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ArlTable', 
    @level2type = 'COLUMN', @level2name = 'AtYear';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tipo / Riesgo de ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ArlTable', 
    @level2type = 'COLUMN', @level2name = 'AtRisk';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tarifa / Porcentaje de cobro', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ArlTable', 
    @level2type = 'COLUMN', @level2name = 'AtAmount';
GO


-- Tabla: PayrollParametersType

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Conceptos / Detalles / Parámetros para liquidación de la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParametersType';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para el parámetro de nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParametersType', 
    @level2type = 'COLUMN', @level2name = 'ParametersTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición del parámetro', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParametersType', 
    @level2type = 'COLUMN', @level2name = 'PtName';
GO

-- Tabla: PayrollPeriod

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición de periodos para liquidación de nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPeriod';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para el periodo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPeriod', 
    @level2type = 'COLUMN', @level2name = 'PeriodId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Año que aplica el periodo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPeriod', 
    @level2type = 'COLUMN', @level2name = 'PrYear';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Mes que aplica el periodo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPeriod', 
    @level2type = 'COLUMN', @level2name = 'PrMont';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de inicio que aplica', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPeriod', 
    @level2type = 'COLUMN', @level2name = 'PrStartDate';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de finalización del periodo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPeriod', 
    @level2type = 'COLUMN', @level2name = 'PrEndDate';
GO


-- Tabla: PensionSolidarityFund

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena la tabla para los cálculos de Fondo de Solidaridad Pensional', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PensionSolidarityFund';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para regla de Fond Solidario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PensionSolidarityFund', 
    @level2type = 'COLUMN', @level2name = 'FundId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Rango mayor o igual a...', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PensionSolidarityFund', 
    @level2type = 'COLUMN', @level2name = 'FuInconeFrom';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Rango menor a...', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PensionSolidarityFund', 
    @level2type = 'COLUMN', @level2name = 'FuInconeTo';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Porcentaje / Tarifa de descuento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PensionSolidarityFund', 
    @level2type = 'COLUMN', @level2name = 'FuRate';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Año en el que aplica la regla', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PensionSolidarityFund', 
    @level2type = 'COLUMN', @level2name = 'FuYear';
GO

-- Tabla: WithholdingTax

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena la tabla para los cálculos de UVT para la retención en la fuente', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para regla de ReteFuente', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax', 
    @level2type = 'COLUMN', @level2name = 'TaId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Año en el que aplica la regla', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax', 
    @level2type = 'COLUMN', @level2name = 'TaYear';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Rango mayor que...', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax', 
    @level2type = 'COLUMN', @level2name = 'TaIncomeFrom';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Rango menor o igual que...', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax', 
    @level2type = 'COLUMN', @level2name = 'TaIncomeTo';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tarifa / Porcentaje de descuento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax', 
    @level2type = 'COLUMN', @level2name = 'TaRate';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'UVT Exentos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax', 
    @level2type = 'COLUMN', @level2name = 'TaUVTDiscount';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'UVT Incremento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'WithholdingTax', 
    @level2type = 'COLUMN', @level2name = 'TaUVTIncrease';
GO

-- Tabla: Eps

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Registros de entidades EPS', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Eps';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de EPS', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Eps', 
    @level2type = 'COLUMN', @level2name = 'EpsId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de la EPS', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Eps', 
    @level2type = 'COLUMN', @level2name = 'EpName';
GO

-- Tabla: Arl

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Registro de entidades ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Arl';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Arl', 
    @level2type = 'COLUMN', @level2name = 'ArlId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de entidades ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Arl', 
    @level2type = 'COLUMN', @level2name = 'ArName';
GO

-- Tabla: Pension

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Registro de entidad de Pensión', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Pension';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de pensión', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Pension', 
    @level2type = 'COLUMN', @level2name = 'PensionId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de la entidad de Pensión', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Pension', 
    @level2type = 'COLUMN', @level2name = 'PnName';
GO

-- Tabla: Caja

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Registro de Cajas de Compensación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Caja';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de tipo de Caja de Compensación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Caja', 
    @level2type = 'COLUMN', @level2name = 'CajaId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre entidad de Caja de Compensación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Caja', 
    @level2type = 'COLUMN', @level2name = 'CjName';
GO

-- Tabla: Cesantias

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Registro de Cesantías', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Cesantias';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de tipo de Cesantías', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Cesantias', 
    @level2type = 'COLUMN', @level2name = 'CesantiasId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de entidad de Cesantías', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Cesantias', 
    @level2type = 'COLUMN', @level2name = 'CsName';
GO

-- Tabla: UserRoles

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Roles, tipos de usuarios en el sistema para el control de permisos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserRoles';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para rol de usuario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserRoles', 
    @level2type = 'COLUMN', @level2name = 'RoleId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición del rol', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserRoles', 
    @level2type = 'COLUMN', @level2name = 'RlName';
GO


-- Tabla: RolePermissions

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los permisos para las tablas por roles', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'RolePermissions';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para permiso por rol', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'RolePermissions', 
    @level2type = 'COLUMN', @level2name = 'RolePermissionsId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación con tabla roles - Indica el rol', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'RolePermissions', 
    @level2type = 'COLUMN', @level2name = 'RpRoleId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Tabla de la base de datos que aplica el permiso', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'RolePermissions', 
    @level2type = 'COLUMN', @level2name = 'RpTableId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Tipo de permiso que aplica - Otorga', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'RolePermissions', 
    @level2type = 'COLUMN', @level2name = 'RpTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Si el permiso / regla se encuentra activa', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'RolePermissions', 
    @level2type = 'COLUMN', @level2name = 'RpActive';
GO

-- Tabla: UserPermissions

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los permisos para las tablas por usuarios', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserPermissions';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de regla de permiso por usuario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserPermissions', 
    @level2type = 'COLUMN', @level2name = 'UserPermissionsId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Id del usuario al cual aplica el permiso', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserPermissions', 
    @level2type = 'COLUMN', @level2name = 'UrEmployeeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Tabla de la base de datos que aplica el permiso', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserPermissions', 
    @level2type = 'COLUMN', @level2name = 'UrTableID';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Tipo de permiso que aplica sobre la tabla - Otorga', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserPermissions', 
    @level2type = 'COLUMN', @level2name = 'UrTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Indica si el permiso / regla se encuentra activa', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'UserPermissions', 
    @level2type = 'COLUMN', @level2name = 'UrActive';
GO

-- Tabla: SystemTables

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena las diferentes tablas del sistema sobre las que se asignarán permisos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'SystemTables';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para una tabla de la base de datos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'SystemTables', 
    @level2type = 'COLUMN', @level2name = 'TableID';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de la tabla en la base de datos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'SystemTables', 
    @level2type = 'COLUMN', @level2name = 'TaName';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Si la tabla esta creada o fue eliminada', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'SystemTables', 
    @level2type = 'COLUMN', @level2name = 'TaActive';
GO

-- Tabla: PayrollParameters

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Almacena los conceptos de devengados y deducciones de la nomina y valores definidos por ley', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para en concepto de liquidación de nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'ParameterId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del tipo de concepto / parámetro', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'PeParametersTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición del concepto para liquidación de nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'PeConcept';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Valor / Porcentaje / Tarifa del concepto - Si aplica', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'PeValue';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Unidad del valor (COP, %, HR)', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'PeUnit';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Estado del concepto. Activo - Inactivo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'PeStatus';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Año en el que aplica el concepto', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'PeYear';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Quien asume el pago del concepto / Responsable ("Trabajador", "Empleador")', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollParameters', 
    @level2type = 'COLUMN', @level2name = 'PeAssumedBy';
GO

-- Tabla: ActionTypes

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tipos de acciones para el log de acciones', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ActionTypes';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para el tipo de acción', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ActionTypes', 
    @level2type = 'COLUMN', @level2name = 'ActionTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición del tipo de acción posible en la base de datos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ActionTypes', 
    @level2type = 'COLUMN', @level2name = 'AtName';
GO

-- Tabla: PayrollStatus

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Estados de la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollStatus';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para estado de liquidación de la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollStatus', 
    @level2type = 'COLUMN', @level2name = 'PayrollStatusId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición estado de nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollStatus', 
    @level2type = 'COLUMN', @level2name = 'PsName';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición del estado de liquidación de una nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollStatus', 
    @level2type = 'COLUMN', @level2name = 'PsDescription';
GO


-- Tabla: PositionStatus

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Estados de un cargo para un empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PositionStatus';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para el estado de un cargo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PositionStatus', 
    @level2type = 'COLUMN', @level2name = 'PositionStatusId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Definición del estado que puede adoptar un cargo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PositionStatus', 
    @level2type = 'COLUMN', @level2name = 'PpStatus';
GO

-- Tabla: LogActions

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Log de acciones, procedimientos, triggers, permisos, ...', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de registro de log acción', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions', 
    @level2type = 'COLUMN', @level2name = 'LaId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador del usuario que ejecuto la acción', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions', 
    @level2type = 'COLUMN', @level2name = 'LaUserId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de usuario que ejecuto la acción', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions', 
    @level2type = 'COLUMN', @level2name = 'LaUsername';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha y Hora en la que ocurrió el evento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions', 
    @level2type = 'COLUMN', @level2name = 'LaDateTime';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Define el tipo de acción que se ejecuto', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions', 
    @level2type = 'COLUMN', @level2name = 'LaActionTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Parámetros usados en la acción - Si Aplica', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions', 
    @level2type = 'COLUMN', @level2name = 'LaParameters';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Información adicional sobre la acción ejecutada', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogActions', 
    @level2type = 'COLUMN', @level2name = 'LaAddInfo';
GO

-- Tabla: LogSQL

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Log de sentencias SQL ejecutas sobre la base de datos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogSQL';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para log de SQL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogSQL', 
    @level2type = 'COLUMN', @level2name = 'LSqlId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador del usuario que ejecuto la sentencia', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogSQL', 
    @level2type = 'COLUMN', @level2name = 'LsUserId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de usuario que ejecuto la consulta', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogSQL', 
    @level2type = 'COLUMN', @level2name = 'LsUsername';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha y hora en la que se ejecuto la acción', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogSQL', 
    @level2type = 'COLUMN', @level2name = 'LsDateTime';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Tabla en la que se ejecuto la acción', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogSQL', 
    @level2type = 'COLUMN', @level2name = 'LsTable';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Sentencia SQL ejecutada', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogSQL', 
    @level2type = 'COLUMN', @level2name = 'LsSQLStatement';
GO

-- Tabla: LogLogins

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Log de los intentos de inicio de sesión', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para log de intento de login', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins', 
    @level2type = 'COLUMN', @level2name = 'LoginId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador del usuario que intento el login - Si aplica', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins', 
    @level2type = 'COLUMN', @level2name = 'LiUserId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre de usuario utilizado en el intento de login', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins', 
    @level2type = 'COLUMN', @level2name = 'LiUsername';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha y hora en la que se registro el evento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins', 
    @level2type = 'COLUMN', @level2name = 'LiDateTime';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Indica si el login fue exitoso o fallido "Success - Failure"', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins', 
    @level2type = 'COLUMN', @level2name = 'LiSuccess';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Dirección IP del cliente', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins', 
    @level2type = 'COLUMN', @level2name = 'LiIP';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Agente identificado (navegador - sistema operativo - otros)', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'LogLogins', 
    @level2type = 'COLUMN', @level2name = 'LiUserAgent';
GO

-- Tabla: EmployeePosition

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Relaciona los cargos que un empleado tuvo o tiene', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para cargo del empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition', 
    @level2type = 'COLUMN', @level2name = 'EmployeePositionId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del Cargo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition', 
    @level2type = 'COLUMN', @level2name = 'EpPositionId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del Usuario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition', 
    @level2type = 'COLUMN', @level2name = 'EpEmployeeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de Inicio en la que aplica el cargo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition', 
    @level2type = 'COLUMN', @level2name = 'EpStartDate';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de finalización en la que aplico el cargo - Si es vació es el cargo actual', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition', 
    @level2type = 'COLUMN', @level2name = 'EpEndDate';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Sueldo base que devengada en el cargo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition', 
    @level2type = 'COLUMN', @level2name = 'EpCurrentSalary';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Estado actual de dicho cargo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'EmployeePosition', 
    @level2type = 'COLUMN', @level2name = 'EpState';
GO

-- Tabla: Contracts

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Contratos realizados a empleados', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Contracts';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de Contrato realizado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Contracts', 
    @level2type = 'COLUMN', @level2name = 'ContractsId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del tipo de contrato', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Contracts', 
    @level2type = 'COLUMN', @level2name = 'CoContractTypeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Contracts', 
    @level2type = 'COLUMN', @level2name = 'CoEmployeeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Cargo asociado al contrato', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Contracts', 
    @level2type = 'COLUMN', @level2name = 'CoEmployeePositionId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de inicio del contrato', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Contracts', 
    @level2type = 'COLUMN', @level2name = 'CoStartDate';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de finalización del contrato', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Contracts', 
    @level2type = 'COLUMN', @level2name = 'CoEndDate';
GO


-- Tabla: Earnings

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Detalle de todos los conceptos devengados - Detalle de la Nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para concepto devengado por el empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings', 
    @level2type = 'COLUMN', @level2name = 'EarningsId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del concepto devengado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings', 
    @level2type = 'COLUMN', @level2name = 'EaParametersId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del usuario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings', 
    @level2type = 'COLUMN', @level2name = 'EaEmployeeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de la nomina liquidada', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings', 
    @level2type = 'COLUMN', @level2name = 'EaPaymentId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Periodo en el se devenga el concepto', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings', 
    @level2type = 'COLUMN', @level2name = 'EaPeriodId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Horas de trabajo (trabajo - extras)', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings', 
    @level2type = 'COLUMN', @level2name = 'EaHours';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto del concepto devengado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Earnings', 
    @level2type = 'COLUMN', @level2name = 'EaAmount';
GO

-- Tabla: Deductions

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Detalle de todos los conceptos deducidos', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Deductions';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de concepto devengado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Deductions', 
    @level2type = 'COLUMN', @level2name = 'DeductionsId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del concepto deducido', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Deductions', 
    @level2type = 'COLUMN', @level2name = 'DeParametersId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Deductions', 
    @level2type = 'COLUMN', @level2name = 'DeEmployeeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de la nomina liquidada', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Deductions', 
    @level2type = 'COLUMN', @level2name = 'DePaymentId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Periodo en la que aplica la deducción', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Deductions', 
    @level2type = 'COLUMN', @level2name = 'DePeriodId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto del concepto deducido', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Deductions', 
    @level2type = 'COLUMN', @level2name = 'DeAmount';
GO

-- Tabla: PayrollPayment

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Nominas liquidadas a los empleados', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de de nomina liquidada', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PaymentId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyEmployeeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del periodo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyPeriodId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Salario Base de la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PySalaryBase';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Salario Devengado (Devengado - Aux. Transporte)', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PySalaryEarned';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Salario Neto (Total pagado)', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PySalaryNet';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto de auxilio de transporte', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyTransportAux';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total / Suma conceptos devengados al empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyTotalEarnings';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total / Suma de conceptos deducidos al empleado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyTotalDeductions';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total / Suma aprovisionado por el empleador', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyTotalProvisioned';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total pagado por el empleador por la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyAmount';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de liquidación de la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PrDateSettlement';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'No. de Comprobante de Pago', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyPaymentVoucher';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha del Comprobante de Pago', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyDateVoucher';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Estado de liquidación de la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollPayment', 
    @level2type = 'COLUMN', @level2name = 'PyPayrollStatusId';
GO

-- Tabla: Employees

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Información de los empleados / usuarios', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de usuario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmployeeId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del tipo de identificación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmIdentificationType';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'No. de identificación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmIdentification';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre(s)', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmName';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Apellido(s)', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmLastName';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Correo electrónico', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmEmail';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Teléfono - Celular', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'Emphone';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Dirección de residencia', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmAddress';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Fecha de nacimiento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmDateBrith';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'USERNAME del Empleado - para login en el sistema', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmUsername';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'PASSWORD del empelado - para login en el sistema', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmPassword';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del estado del usuario', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmStatusId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del rol asociado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmUserRoleId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de entidad Caja de Compensación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmCaja';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de Entidad ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmArl';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de entidad EPS', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmEps';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de entidad Pensión', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmPension';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de entidad Cesantías', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'Employees', 
    @level2type = 'COLUMN', @level2name = 'EmCesantias';
GO

-- Tabla: PayrollProvisioning

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Registra el detalle de Aprovisionamiento generado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único para detalle de aprovisionamiento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'ProvisioningId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de la nomina liquidada', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgPaymentId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador de Concepto aprovisionado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgParametersId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto del concepto', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgAmount';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto calculado para pago SENA', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgSena';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto calculado para pago ICBF', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgICBF';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto calculado para pago Caja de Compensación', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgCaja';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto pago Salud por parte del empleador', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgSalud';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto pago Pensión por parte del empleador', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgPension';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto de pago para ARL', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgArl';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto aprovisionado para Prima de servicios', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgPrima';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto aprovisionado para Cesantías', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgCesantias';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto Interés sobre las Cesantías', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgIntCesantias';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Monto aprovisionado para Vacaciones', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollProvisioning', 
    @level2type = 'COLUMN', @level2name = 'PgVacaciones';
GO

-- Tabla: PayrollSummary

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Resumen de la nomina generada por periodo', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único de resumen de nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SummaryId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Relación - Identificador del periodo liquidado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmPeriodId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total de salario base', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmSalaryBase';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total de salario devengado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmSalaryEarned';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total de salario Neto', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmSalaryNet';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total Devengado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmEarnings';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total Deducido', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmDeductions';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total Aprovisionado', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmProvisioned';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Total pagado por la nomina', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'PayrollSummary', 
    @level2type = 'COLUMN', @level2name = 'SmPayrollPayment';
GO


-- Tabla: ProcedureMappings

EXEC sp_addextendedproperty 
    @name = 'MS_Description',  
    @value = 'Almacena los alias usados por la API para encapsular el nombre real', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ProcedureMappings';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Identificador único del alias del procedimiento', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ProcedureMappings', 
    @level2type = 'COLUMN', @level2name = 'MappingId';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre que usa la API', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ProcedureMappings', 
    @level2type = 'COLUMN', @level2name = 'MaApiName';
GO

EXEC sp_addextendedproperty 
    @name = 'MS_Description', 
    @value = 'Nombre real del procedimiento en SQL Srv', 
    @level0type = 'SCHEMA', @level0name = 'dbo', 
    @level1type = 'TABLE', @level1name = 'ProcedureMappings', 
    @level2type = 'COLUMN', @level2name = 'MaDbName';
GO