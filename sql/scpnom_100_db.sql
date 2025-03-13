-- -----------------------------------------------------
-- Schema SCPNOM
-- Version: 1.0.0
-- Author: Jorge Leonardo Ruiz
-- MSSQL
-- Description: Script para crear la base de datos y tablas
-- -----------------------------------------------------


-- Verifica si el LOGIN ya existe en el servidor
IF NOT EXISTS (SELECT * FROM sys.server_principals WHERE name = 'admin_bd')
BEGIN
    CREATE LOGIN admin_bd WITH PASSWORD = 'Clave123', CHECK_POLICY = OFF;
END
GO

-- Usa la base de datos SCPNOM
USE SCPNOM;
GO

-- Verifica si el USUARIO ya existe en la base de datos
IF NOT EXISTS (SELECT * FROM sys.database_principals WHERE name = 'admin_bd')
BEGIN
    CREATE USER admin_bd FOR LOGIN admin_bd;
END
GO

-- Otorga permisos de administración en la base de datos
ALTER ROLE db_owner ADD MEMBER admin_bd;
GO


-- ----------------------------------------------------------
--    Creación de tablas
-- ----------------------------------------------------------

/* 
   Tabla: ContractTypes
   Descripción: Almacena los tipos de contrato 
*/

CREATE TABLE ContractType (
    ContractTypeId INT PRIMARY KEY IDENTITY(1,1),
    CtName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_ContractType UNIQUE (CtName)
);
GO

/* 
   Tabla: Departments
   Descripción: Almacena los departamentos, areas de la empresa
*/

CREATE TABLE Departments (
    DepartmentId INT PRIMARY KEY IDENTITY(1,1),
    DeName VARCHAR(100) NOT NULL,
    CONSTRAINT UQ_DepartmentName UNIQUE (DeName)
);
GO

/* 
   Tabla: Positions
   Descripción: Almacena los cargos de la empresa
*/

CREATE TABLE Positions (
    PositionId INT PRIMARY KEY IDENTITY(1,1),
    PoName VARCHAR(100) NOT NULL,
    PoDepartmentID INT NOT NULL
);
GO

/* 
   Tabla: IdentificationType
   Descripción: Almacena los tipos de identificación para empleados
*/

CREATE TABLE IdentificationType (
    IdentificaciónTypeId INT PRIMARY KEY IDENTITY(1,1),
    IdType VARCHAR(40) NOT NULL,
    CONSTRAINT UQ_IdentificationType UNIQUE (IdType)
);
GO

/* 
   Tabla: UserStatus
   Descripción: Almacena los estados que puede tener un usuario, empleado
*/

CREATE TABLE UserStatus (
    StatusId INT PRIMARY KEY IDENTITY(1,1),
    StName VARCHAR(20) NOT NULL,
    CONSTRAINT UQ_StatusName UNIQUE (StName)
);
GO

/* 
   Tabla: PermissionsType
   Descripción: Tipos de permisos sobre las tablas que se pueden otorgar
*/

CREATE TABLE PermissionsType (
    PermissionTypeId INT PRIMARY KEY IDENTITY(1,1),
    PtName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_PermissionsName UNIQUE (PtName)
);
GO

/* 
   Tabla: ArlTable
   Descripción: Define las reglas de liquidación para ARL
*/

CREATE TABLE ArlTable (
    AtId BIGINT PRIMARY KEY IDENTITY(1,1),
    AtYear VARCHAR(4) NOT NULL,
    AtRisk VARCHAR(50) NOT NULL,
    AtAmount DECIMAL(5,3) NOT NULL
);
GO

/* 
   Tabla: PayrollParametersType
   Descripción: Tipos de conceptos para la nomina
*/

CREATE TABLE PayrollParametersType (
    ParametersTypeId BIGINT PRIMARY KEY IDENTITY(1,1),
    PtName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_ParametersName UNIQUE (PtName)
);
GO

/* 
   Tabla: PayrollPeriod
   Descripción: Definición de periodos para liquidación de nomina
*/

CREATE TABLE PayrollPeriod (
    PeriodId BIGINT PRIMARY KEY IDENTITY(1,1),
    PrYear VARCHAR(4) NOT NULL,
    PrMont VARCHAR(2) NOT NULL,
    PrStartDate DATE NOT NULL,
    PrEndDate DATE NOT NULL,
    CONSTRAINT UQ_PayrollPeriod_YearMonth UNIQUE (PrYear, PrMont)
);
GO

/* 
   Tabla: PensionSolidarityFund
   Descripción: Almacena la tabla para los cálculos de Fondo de Solidaridad Pensional
*/

CREATE TABLE PensionSolidarityFund (
    FundId BIGINT PRIMARY KEY IDENTITY(1,1),
    FuInconeFrom INT NOT NULL,
    FuInconeTo INT NOT NULL,
    FuRate DECIMAL(5,2) NOT NULL,
    FuYear VARCHAR(4) NOT NULL
);
GO

/* 
   Tabla: WithholdingTax
   Descripción: Almacena la tabla para los cálculos de UVT para la retención en la fuente
*/

CREATE TABLE WithholdingTax (
    TaId BIGINT PRIMARY KEY IDENTITY(1,1),
    TaYear VARCHAR(4) NOT NULL,
    TaIncomeFrom INT NOT NULL,
    TaIncomeTo INT NOT NULL,
    TaRate DECIMAL(5,2) NOT NULL,
    TaUVTDiscount INT,
    TaUVTIncrease INT
);
GO

/* 
   Tabla: Eps
   Descripción: Registro de EPS
*/

CREATE TABLE Eps (
    EpsId BIGINT PRIMARY KEY IDENTITY(1,1),
    EpName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Eps UNIQUE (EpName)
);
GO

/* 
   Tabla: ARL
   Descripción: Registro de ARL
*/

CREATE TABLE Arl (
    ArlId BIGINT PRIMARY KEY IDENTITY(1,1),
    ArName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Arl UNIQUE (ArName)
);
GO

/* 
   Tabla: Pensión
   Descripción: Registro de entidad de Pensión
*/

CREATE TABLE Pension (
    PensionId BIGINT PRIMARY KEY IDENTITY(1,1),
    PnName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Pension UNIQUE (PnName)
);
GO

/* 
   Tabla: Caja
   Descripción: Registro de Cajas de Compensación
*/

CREATE TABLE Caja (
    CajaId BIGINT PRIMARY KEY IDENTITY(1,1),
    CjName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Caja UNIQUE (CjName)
);
GO

/* 
   Tabla: Cesantías
   Descripción: Registro de Cesantías
*/

CREATE TABLE Cesantias (
    CesantiasId BIGINT PRIMARY KEY IDENTITY(1,1),
    CsName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_Cesantias UNIQUE (CsName)
);
GO

/* 
   Tabla: UserRoles
   Descripción: Roles, tipos de usuarios en el sistema para control de permisos
*/

CREATE TABLE UserRoles (
    RoleId INT PRIMARY KEY IDENTITY(1,1),
    RlName VARCHAR(50) NOT NULL,
    CONSTRAINT UQ_RoleName UNIQUE (RlName)
);
GO

/* 
   Tabla: RolePermissions
   Descripción: Almacena los permisos a las tablas por roles
*/

CREATE TABLE RolePermissions (
    RolePermissionsId BIGINT PRIMARY KEY IDENTITY(1,1),
    RpRoleId INT NOT NULL,
    RpTableId INT NOT NULL,
    RpTypeId INT NOT NULL,
    RpActive BIT NOT NULL DEFAULT 1
);
GO

/* 
   Tabla: UserPermissions
   Descripción: Almacena los permisos a las tablas por usuarios
*/

CREATE TABLE UserPermissions (
    UserPermissionsId BIGINT PRIMARY KEY IDENTITY(1,1),
    UrEmployeeId BIGINT NOT NULL,
    UrTableId INT NOT NULL,
    UrTypeId INT NOT NULL,
    UrActive BIT NOT NULL
);
GO

/* 
   Tabla: SystemTables 
   Descripción: Almacena las diferentes tablas del sistema sobre las que se asignarán permisos.
*/

CREATE TABLE SystemTables (
    TableID INT IDENTITY(1,1) PRIMARY KEY,
    TaName NVARCHAR(255) UNIQUE NOT NULL,
    TaActive BIT NOT NULL DEFAULT 1
    CONSTRAINT UQ_TableName UNIQUE (TaName)
);


/* 
   Tabla: PayrollParameters
   Descripción: Almacena los conceptos de devengados y deducciones de la nomina y valores definidos por ley
*/

CREATE TABLE PayrollParameters (
    ParameterId BIGINT PRIMARY KEY IDENTITY(1,1),
    PeParametersTypeId BIGINT NOT NULL,
    PeConcept VARCHAR(50) NOT NULL,
    PeValue DECIMAL(10,2) DEFAULT 0,
    PeUnit VARCHAR(4),
    PeStatus BIT NOT NULL DEFAULT 1, -- 1 Active 0 Inactive
    PeYear VARCHAR(4) NOT NULL,
    PeAssumedBy VARCHAR(10) NOT NULL CHECK (PeAssumedBy IN ('Trabajador', 'Empleador'))
);
GO

/* 
   Tabla: ActionTypes
   Descripción: Tipos de acciones para el log de acciones
*/

CREATE TABLE ActionTypes (
    ActionTypeId BIGINT PRIMARY KEY IDENTITY(1,1),
    AtName VARCHAR(100) NOT NULL,
    CONSTRAINT UQ_ActionTypes UNIQUE (AtName)
);
GO

/* 
   Tabla: PayrollStatus
   Descripción: Estados de la nomina
*/

CREATE TABLE PayrollStatus (
    PayrollStatusId BIGINT PRIMARY KEY IDENTITY(1,1),
    PsName VARCHAR(50) NOT NULL,
    PsDescription VARCHAR(200),
    CONSTRAINT UQ_PayrollStatusId UNIQUE (PsName)
);
GO

/* 
   Tabla: PositionStatus
   Descripción: Estados de un cargo
*/

CREATE TABLE PositionStatus (
    PositionStatusId BIGINT PRIMARY KEY IDENTITY(1,1),
    PpStatus VARCHAR(20) NOT NULL,
    CONSTRAINT UQ_PositionStatus UNIQUE (PpStatus)
);
GO

/* 
   Tabla: LogActions
   Descripción: Log de acciones, procedimientos, triggers, permisos, ...
*/

CREATE TABLE LogActions (
    LaId BIGINT PRIMARY KEY IDENTITY(1,1),
    LaUserId BIGINT NOT NULL,
    LaUsername VARCHAR(50) NOT NULL,
    LaDateTime DATETIME NOT NULL,
    LaActionTypeId BIGINT NOT NULL,
    LaParameters VARCHAR(200) DEFAULT '0',
    LaAddInfo VARCHAR(max) DEFAULT '0'
);
GO

/* 
   Tabla: LogSQL
   Descripción: Log de sentencias SQL ejecutas sobre la base de datos
*/

CREATE TABLE LogSQL (
    LSqlId BIGINT PRIMARY KEY IDENTITY(1,1),
    LsUserId BIGINT NOT NULL,
    LsUsername VARCHAR(50) NOT NULL,
    LsDateTime DATETIME NOT NULL,
    LsTable VARCHAR(200) NOT NULL,
    LsSQLStatement VARCHAR(max) DEFAULT '0'
);
GO

/* 
   Tabla: LogLogins
   Descripción: Log de los intentos de inicio de sesión 
*/

CREATE TABLE LogLogins (
    LoginId BIGINT PRIMARY KEY IDENTITY(1,1),
    LiUserId BIGINT NOT NULL,
    LiUsername VARCHAR(50) NOT NULL,
    LiDateTime DATETIME NOT NULL,
    LiSuccess BIT NOT NULL DEFAULT 0, -- 1 - Success 0 - Failure
    LiIP VARCHAR(50) DEFAULT '0',
    LiUserAgent VARCHAR(255)
);
GO

/* 
   Tabla: EmployeePosition
   Descripción: Relaciona los cargos que tubo un empleado, en que fechas y que salario
*/

CREATE TABLE EmployeePosition (
    EmployeePositionId BIGINT PRIMARY KEY IDENTITY(1,1),
    EpPositionId INT NOT NULL,
    EpEmployeeId BIGINT NOT NULL,
    EpStartDate DATE NOT NULL,
    EpEndDate DATE,
    EpCurrentSalary DECIMAL(10,2) NOT NULL DEFAULT 0,
    EpState INT NOT NULL
);
GO

/*  
   Tabla: Contracts
   Descripción: Contratos realizados a empleados
*/

CREATE TABLE Contracts (
    ContractsId BIGINT PRIMARY KEY IDENTITY(1,1),
    CoContractTypeId INT NOT NULL,
    CoEmployeeId BIGINT NOT NULL,
    CoEmployeePositionId BIGINT NOT NULL,
    CoStartDate DATE NOT NULL,
    CoEndDate DATE
);
GO

/* 
   Tabla: Earnings
   Descripción: Detalle de todos los conceptos devengados
*/

CREATE TABLE Earnings (
    EarningsId BIGINT PRIMARY KEY IDENTITY(1,1),
    EaParametersId BIGINT NOT NULL,
    EaEmployeeId BIGINT NOT NULL,
    EaPaymentId BIGINT NOT NULL,
    EaPeriodId BIGINT NOT NULL,
    EaHours INT DEFAULT 0,
    EaAmount DECIMAL(10,2) NOT NULL
);
GO

/* 
   Tabla: Deductions
   Descripción: Detalle de todos los conceptos deducidos
*/

CREATE TABLE Deductions (
    DeductionsId BIGINT PRIMARY KEY IDENTITY(1,1),
    DeParametersId BIGINT NOT NULL,
    DeEmployeeId BIGINT NOT NULL,
    DePaymentId BIGINT NOT NULL,
    DePeriodId BIGINT NOT NULL,
    DeAmount DECIMAL(10,2) NOT NULL
);
GO

/* 
   Tabla: PayrollPayment
   Descripción: Nominas generas por empleados
*/

CREATE TABLE PayrollPayment (
    PaymentId BIGINT PRIMARY KEY IDENTITY(1,1),
    PyEmployeeId BIGINT NOT NULL,
    PyPeriodId BIGINT NOT NULL,
    PySalaryBase DECIMAL(10,2) NOT NULL,
    PySalaryEarned DECIMAL(10,2) NOT NULL DEFAULT 0,
    PySalaryNet DECIMAL(10,2) NOT NULL DEFAULT 0,
    PyTransportAux DECIMAL(10,2) NOT NULL DEFAULT 0,
    PyTotalEarnings DECIMAL(10,2) NOT NULL DEFAULT 0,
    PyTotalDeductions DECIMAL(10,2) NOT NULL DEFAULT 0,
    PyTotalProvisioned DECIMAL(18,2) NOT NULL DEFAULT 0,
    PyAmount DECIMAL(10,2) NOT NULL,
    PrDateSettlement DATE,
    PyPaymentVoucher VARCHAR(100),
    PyDateVoucher DATE,
    PyPayrollStatusId BIGINT NOT NULL
);
GO

/* 
   Tabla: Employess
   Descripción: Información de los empleados y usuarios
*/

CREATE TABLE Employees (
    EmployeeId BIGINT PRIMARY KEY IDENTITY(1,1),
    EmIdentificationType INT NOT NULL,
    EmIdentification VARCHAR(10) NOT NULL,
    EmName VARCHAR(100) NOT NULL,
    EmLastName VARCHAR(100) NOT NULL,
    EmEmail VARCHAR(255) UNIQUE NOT NULL,
    Emphone VARCHAR(20),
    EmAddress VARCHAR(200),
    EmDateBrith DATE NOT NULL,
    EmUsername VARCHAR(50) NOT NULL,
    EmPassword VARBINARY(64) NOT NULL,
    EmStatusId INT NOT NULL,
    EmUserRoleId INT NOT NULL,
    EmCaja BIGINT,
    EmArl BIGINT,
    EmEps BIGINT,
    EmPension BIGINT,
    EmCesantias BIGINT
);
GO

/* 
   Tabla: PayrollProvisioning
   Descripción: Registra el Aprovisionamiento generado
*/

CREATE TABLE PayrollProvisioning (
    ProvisioningId BIGINT PRIMARY KEY IDENTITY(1,1),
    PgPaymentId BIGINT NOT NULL,
    PgParametersId BIGINT NOT NULL,
    PgAmount DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgSena DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgICBF DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgCaja DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgSalud DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgPension DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgArl DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgPrima DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgCesantias DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgIntCesantias DECIMAL(18,2) NOT NULL DEFAULT 0,
    PgVacaciones DECIMAL(18,2) NOT NULL DEFAULT 0
);
GO

/* 
   Tabla: PayrollSummary
   Descripción: Resumen de la nomina generada por periodo
*/

CREATE TABLE PayrollSummary (
    SummaryId BIGINT PRIMARY KEY IDENTITY(1,1),
    SmPeriodId BIGINT NOT NULL,
    SmSalaryBase DECIMAL(10,2) NOT NULL,
    SmSalaryEarned DECIMAL(10,2) NOT NULL DEFAULT 0,
    SmSalaryNet DECIMAL(10,2) NOT NULL DEFAULT 0,
    SmEarnings DECIMAL(10,2) NOT NULL DEFAULT 0,
    SmDeductions DECIMAL(10,2) NOT NULL DEFAULT 0,
    SmProvisioned DECIMAL(18,2) NOT NULL DEFAULT 0,
    SmPayrollPayment DECIMAL(20,2) NOT NULL
);
GO

/* 
   Tabla: ProcedureMappings
   Descripción: Almacena los alias usados por la API para encapsular el nombre real
*/

CREATE TABLE ProcedureMappings (
    MappingId INT IDENTITY(1,1) PRIMARY KEY,
    MaApiName VARCHAR(255) UNIQUE NOT NULL,
    MaDbName VARCHAR(255) UNIQUE NOT NULL
);

-- ----------------------------------------------------------
--    Creación de Foreign Keys.
-- ----------------------------------------------------------


-- FK EmployeePosition
ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePosition_Employee FOREIGN KEY (EpEmployeeId) REFERENCES Employees(EmployeeId);
GO

-- FK UserPermissions
ALTER TABLE UserPermissions
ADD CONSTRAINT FK_UserPermissions_Employee FOREIGN KEY (UrEmployeeId) REFERENCES Employees(EmployeeId);
GO

-- RolePermissions
ALTER TABLE RolePermissions
ADD CONSTRAINT FK_RolePermissions FOREIGN KEY (RpRoleId) REFERENCES UserRoles(RoleId);
GO

ALTER TABLE RolePermissions
ADD CONSTRAINT FK_TypePermissions FOREIGN KEY (RpTypeId) REFERENCES PermissionsType(PermissionTypeId);
GO

ALTER TABLE RolePermissions 
ADD CONSTRAINT FK_RolePermissions_SystemTables FOREIGN KEY (RpTableId) REFERENCES SystemTables(TableID);

-- Positions
ALTER TABLE Positions
ADD CONSTRAINT FK_PositionDepartments FOREIGN KEY (PoDepartmentID) REFERENCES Departments(DepartmentId);
GO

-- UserPermissions
ALTER TABLE UserPermissions
ADD CONSTRAINT FK_UserPermissions FOREIGN KEY (UrTypeId) REFERENCES PermissionsType(PermissionTypeId);
GO

ALTER TABLE UserPermissions 
ADD CONSTRAINT FK_UserPermissions_SystemTables FOREIGN KEY (UrTableId) REFERENCES SystemTables(TableID);

-- PayrollParameters
ALTER TABLE PayrollParameters
ADD CONSTRAINT FK_PayrollParameters FOREIGN KEY (PeParametersTypeId) REFERENCES PayrollParametersType(ParametersTypeId);
GO

-- LogActions
ALTER TABLE LogActions
ADD CONSTRAINT FK_LogActionType FOREIGN KEY (LaActionTypeId) REFERENCES ActionTypes(ActionTypeId);
GO

-- EmployeePosition
ALTER TABLE EmployeePosition
ADD CONSTRAINT FK_EmployeePosition FOREIGN KEY (EpPositionId) REFERENCES Positions(PositionId);
GO


-- Contracts
ALTER TABLE Contracts
ADD CONSTRAINT FK_ContractType FOREIGN KEY (CoContractTypeId) REFERENCES ContractType(ContractTypeId);
GO

ALTER TABLE Contracts
ADD CONSTRAINT FK_EmployeeContracts FOREIGN KEY (CoEmployeeId) REFERENCES Employees(EmployeeId);
GO

ALTER TABLE Contracts
ADD CONSTRAINT FK_ContractPosition FOREIGN KEY (CoEmployeePositionId) REFERENCES EmployeePosition(EmployeePositionId);
GO

-- Earnings
ALTER TABLE Earnings
ADD CONSTRAINT FK_ParametersEarnings FOREIGN KEY (EaParametersId) REFERENCES PayrollParameters(ParameterId);
GO

ALTER TABLE Earnings
ADD CONSTRAINT FK_EmployeeEarnings FOREIGN KEY (EaEmployeeId) REFERENCES Employees(EmployeeId);
GO

ALTER TABLE Earnings
ADD CONSTRAINT FK_PayrollEarnings FOREIGN KEY (EaPaymentId) REFERENCES PayrollPayment(PaymentId);
GO

ALTER TABLE Earnings
ADD CONSTRAINT FK_PeriodEarnigs FOREIGN KEY (EaPeriodId) REFERENCES PayrollPeriod(PeriodId);
GO

-- Deductions
ALTER TABLE Deductions
ADD CONSTRAINT FK_ParametersDeductions FOREIGN KEY (DeParametersId) REFERENCES PayrollParameters(ParameterId);
GO

ALTER TABLE Deductions
ADD CONSTRAINT FK_EmployeeDeductions FOREIGN KEY (DeEmployeeId) REFERENCES Employees(EmployeeId);
GO

ALTER TABLE Deductions
ADD CONSTRAINT FK_PayrollDeductions FOREIGN KEY (DePaymentId) REFERENCES PayrollPayment(PaymentId);
GO

ALTER TABLE Deductions
ADD CONSTRAINT FK_PeriodDeductions FOREIGN KEY (DePeriodId) REFERENCES PayrollPeriod(PeriodId);
GO


-- PayrollPayment
ALTER TABLE PayrollPayment
ADD CONSTRAINT UQ_PaymentVoucher UNIQUE (PyPaymentVoucher);
GO

ALTER TABLE PayrollPayment
ADD CONSTRAINT FK_EmployeePayroll FOREIGN KEY (PyEmployeeId) REFERENCES Employees(EmployeeId);
GO

ALTER TABLE PayrollPayment
ADD CONSTRAINT FK_PeriodPayroll FOREIGN KEY (PyPeriodId) REFERENCES PayrollPeriod(PeriodId);
GO

ALTER TABLE PayrollPayment
ADD CONSTRAINT FK_StatusPayroll FOREIGN KEY (PyPayrollStatusId) REFERENCES PayrollStatus(PayrollStatusId);
GO

-- Employees
ALTER TABLE Employees
ADD CONSTRAINT UQ_IdentificarionEmployees UNIQUE (EmIdentification);
GO

ALTER TABLE Employees
ADD CONSTRAINT UQ_UsernameEmployees UNIQUE (EmUsername);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeIdentification FOREIGN KEY (EmIdentificationType) REFERENCES IdentificationType(IdentificaciónTypeId);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeStatus FOREIGN KEY (EmStatusId) REFERENCES UserStatus(StatusId);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeRole FOREIGN KEY (EmUserRoleId) REFERENCES UserRoles(RoleId);
GO

-- PayrollProvisioning
ALTER TABLE PayrollProvisioning
ADD CONSTRAINT FK_ProvisioningPayment FOREIGN KEY (PgPaymentId) REFERENCES PayrollPayment(PaymentId);
GO

ALTER TABLE PayrollProvisioning
ADD CONSTRAINT FK_ProvisioningParamenters FOREIGN KEY (PgParametersId) REFERENCES  PayrollParameters(ParameterId);
GO

-- PayrollSummary
ALTER TABLE PayrollSummary
ADD CONSTRAINT FK_PeriodSummary FOREIGN KEY (SmPeriodId) REFERENCES PayrollPeriod(PeriodId);
GO

-- Seguridad Social
ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeEps FOREIGN KEY (EmEps) REFERENCES Eps(EpsId);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeePension FOREIGN KEY (EmPension) REFERENCES Pension(PensionId);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeArl FOREIGN KEY (EmArl) REFERENCES Arl(ArlId);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeCaja FOREIGN KEY (EmCaja) REFERENCES Caja(CajaId);
GO

ALTER TABLE Employees
ADD CONSTRAINT FK_EmployeeCesantias FOREIGN KEY (EmCesantias) REFERENCES Cesantias(CesantiasId);
GO




-- ----------------------------------------------------------
--    Creación de índices
-- ----------------------------------------------------------

CREATE INDEX ID_Employees_Identification ON Employees (EmIdentification);
CREATE INDEX ID_Employees_Username ON Employees (EmUsername);
GO

CREATE INDEX ID_PayrollPeriod_YearMonth ON PayrollPeriod (PrYear, PrMont);
GO

CREATE INDEX ID_EpsName ON Eps (EpName);
CREATE INDEX ID_PensionName ON Pension (PnName);
CREATE INDEX ID_CajaName ON Caja (CjName);
CREATE INDEX ID_CsantiasName ON Cesantias (CsName);
CREATE INDEX ID_ArlName ON Arl (ArName);
GO

CREATE INDEX ID_UserRoles ON UserRoles (RlName);
GO

CREATE INDEX IX_UserPermissionActive ON UserPermissions (UrTableId, UrTypeId) WHERE UrActive = 1;
GO

CREATE INDEX IX_RolePermissionActive ON RolePermissions (RpTable, RpTypeId) WHERE RpActive = 1;
GO

CREATE INDEX ID_Payroll_Concept ON PayrollParameters (PeConcept);
GO


CREATE INDEX ID_LogAction_Username ON LogActions (LaUsername);
CREATE INDEX ID_LogAction_UserId  ON LogActions (LaUserId);
CREATE INDEX ID_LogSQL_Username ON LogSQL (LsUsername);
CREATE INDEX ID_LogSQL_UserId ON LogSQL (LsUserId);
CREATE INDEX ID_LogLogins_Username ON LogLogins (LiUsername);
CREATE INDEX ID_LogLogins_UserId ON LogLogins (LiUserId);
GO
