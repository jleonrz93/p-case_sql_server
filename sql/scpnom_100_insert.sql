-- -----------------------------------------------------
-- Schema SCPNOM
-- Version: 1.0.0
-- Author: Jorge Leonardo Ruiz
-- MSSQL
-- Description: Script para crear la base de datos y tablas
-- -----------------------------------------------------

-- Usar la base de datos
USE SCPNOM;
GO

-- -----------------------------------------------------------
-- -----------------------------------------------------------
-- DESHABILITA VALIDACIÓN DE LLAVES MIENTRAS INSERTA
-- -----------------------------------------------------------
-- -----------------------------------------------------------


EXEC sp_MSforeachtable "ALTER TABLE ? NOCHECK CONSTRAINT ALL";
GO


-- Insert a Estado de Nomina

INSERT INTO PayrollStatus (PsName, PsDescription) VALUES
('Calculada', 'La nómina ha sido calculada pero aún no ha sido aprobada.'),
('Pagada', 'La nómina ha sido totalmente pagada.'),
('Cancelada', 'La nómina ha sido cancelada.');

INSERT INTO ContractType (CtName) VALUES 
('Indefinido'),('Fijo'),('Obra o labor'),('Aprendizaje'),
('Prestación de servicios'),('Ocasional'),('Temporal');

-- Insertando datos en Departments
INSERT INTO Departments (DeName) VALUES 
('Recursos Humanos'),('Finanzas'),('Tecnología'),('Ventas'),('Marketing'),
('Logística'),('Producción'),('Compras'),('Atención al Cliente'),('Legal'), ('System');

-- Insertando datos en Positions (asociando a los departamentos)
INSERT INTO Positions (PoName, PoDepartmentID) VALUES 
('Gerente de RRHH', 1),('Analista de Nómina', 1),('Contador', 2),
('Auditor Financiero', 2),('Desarrollador Backend', 3),
('Desarrollador Frontend', 3),('Ejecutivo de Ventas', 4),
('Coordinador de Marketing', 5),('Supervisor de Logística', 6),
('Abogado Corporativo', 10),('Especialista en Selección', 1),  
('Tesorero', 2),  ('Ingeniero de Infraestructura', 3),  
('Administrador de Base de Datos', 3),  ('Asesor Comercial', 4),  
('Diseñador Gráfico', 5),  ('Coordinador de Distribución', 6),  
('Operario de Producción', 7),  ('Analista de Compras', 8),  
('Representante de Servicio al Cliente', 9), ('System', 11);

INSERT INTO IdentificationType (IdType) VALUES 
('Sin Identificación'),('Cédula de Ciudadanía'),  
('Cédula de Extranjería'), ('Pasaporte'),  
('Permiso Especial de Permanencia'),  
('Carné Diplomático'), ('Documento Nacional de Identidad');

INSERT INTO UserStatus (StName) VALUES 
('Activo'),
('Inactivo'),
('Bloqueado'),
('Eliminado');


INSERT INTO PermissionsType (PtName) VALUES 
('INSERT'),
('UPDATE'),
('DELETE'),
('SELECT'),
('EXECUTE'),
('IMPERSONATE'),
('MERGE');


INSERT INTO PayrollParametersType (PtName) VALUES 
('Horas Extras'),('ARL'),
('Seguridad Social'),('Parafiscales'),
('ReteFuente'),('Fondo de Solidaridad Pensional'), ('Parámetros'),
('Otras Deducciones'),('Otros Devengados'),('Prestaciones Sociales');


INSERT INTO ArlTable (AtRisk, AtAmount, AtYear) VALUES
('I', 0.522, '2025'),
('II', 1.044, '2025'),
('III', 2.436, '2025'),
('IV', 4.350, '2025'),
('V', 6.960, '2025');

INSERT INTO PayrollPeriod (PrYear, PrMont, PrStartDate, PrEndDate) VALUES
('2025', '01', '2025-01-01', '2025-01-31'),
('2025', '02', '2025-02-01', '2025-02-28'),
('2025', '03', '2025-03-01', '2025-03-31'),
('2025', '04', '2025-04-01', '2025-04-30'),
('2025', '05', '2025-05-01', '2025-05-31'),
('2025', '06', '2025-06-01', '2025-06-30'),
('2025', '07', '2025-07-01', '2025-07-31'),
('2025', '08', '2025-08-01', '2025-08-31'),
('2025', '09', '2025-09-01', '2025-09-30'),
('2025', '10', '2025-10-01', '2025-10-31'),
('2025', '11', '2025-11-01', '2025-11-30'),
('2025', '12', '2025-12-01', '2025-12-31');

-- Inserción en la tabla PensionSolidarityFund
INSERT INTO PensionSolidarityFund (FuInconeFrom, FuInconeTo, FuRate, FuYear) VALUES 
(4, 16, 1.00, '2025'),
(16, 17, 1.20, '2025'),
(17, 18, 1.40, '2025'),
(18, 19, 1.60, '2025'),
(19, 20, 1.80, '2025'),
(20, 255, 1.50, '2025');

INSERT INTO WithholdingTax (TaYear, TaIncomeFrom, TaIncomeTo, TaRate, TaUVTDiscount, TaUVTIncrease) VALUES 
('2025', 0, 95, 0.00, 0, 0),
('2025', 95, 150, 19.00, 95, 0),
('2025', 150, 360, 28.00, 150, 10),
('2025', 360, 640, 33.00, 360, 69),
('2025', 640, 945, 35.00, 640, 162),
('2025', 945, 2300, 37.00, 945, 268),
('2025', 2300, 100000, 39.00, 2300, 770);


-- Inserción en la tabla UserRoles
INSERT INTO UserRoles (RlName) VALUES 
('System'), 
('Administrador'), 
('Empleado'), 
('Recursos Humanos'), 
('Financiera'), 
('Invitado');

INSERT INTO PayrollParameters (PeParametersTypeId, PeConcept, PeValue, PeUnit, PeStatus, PeYear, PeAssumedBy) VALUES 
(1, 'Horas extras diurno', 25.00, '%', 1, 2024, 'Empleador'), 
(1, 'Horas nocturno', 35.00, '%', 1, 2024, 'Empleador'),
(1, 'Horas extras nocturno', 75.00, '%', 1, 2024, 'Empleador'),
(1, 'Horas dominical o festivo', 75.00, '%', 1, 2024, 'Empleador'),
(1, 'Horas extras diurno dominical o festivo', 100.00, '%', 1, 2024, 'Empleador'),
(1, 'Horas nocturno en dominical o festivo', 110.00, '%', 1, 2024, 'Empleador'),
(1, 'Horas extras nocturno dominical o festivo', 150.00, '%', 1, 2024, 'Empleador'),
(7, 'Salario Mínimo 2025', 1423500.00, 'COP', 1, 2024, 'Empleador'),
(7, 'Auxilio de transporte 2025', 200000.00, 'COP', 1, 2024, 'Empleador'),
(7, 'Días liquidados', 0.00, 'HR', 1, 2024, 'Empleador'),
(9, 'Comisiones', 0.00, 'COP', 1, 2024, 'Empleador'),
(9, 'Bonificaciones', 0.00, 'COP', 1, 2024, 'Empleador'),
(9, 'Viáticos', 0.00, 'COP', 1, 2024, 'Empleador'),
(9, 'Incapacidades', 0.00, 'COP', 1, 2024, 'Empleador'),
(9, 'Licencias', 0.00, 'COP', 1, 2024, 'Empleador'),
(7, 'Vacaciones', 0.00, 'COP', 1, 2024, 'Empleador'),
(2, 'ARL', 0.00, 'COP', 1, 2024, 'Empleador'),
(5, 'ReteFuente', 0.00, 'COP', 1, 2024, 'Empleador'),
(6, 'Fondo de Solidaridad Pensional', 0.00, 'COP', 1, 2024, 'Trabajador'),
(3, 'Salud Trabajador', 4.00, '%', 1, 2024, 'Trabajador'),
(3, 'Salud Empleador', 8.50, '%', 1, 2024, 'Empleador'),
(3, 'Pensión Trabajador', 4.00, '%', 1, 2024, 'Trabajador'),
(3, 'Pensión Empleador', 12.00, '%', 1, 2024, 'Empleador'),
(10, 'Prima de Servicios', 8.33, '%', 1, 2024, 'Empleador'),
(10, 'Cesantías', 8.33, '%', 1, 2024, 'Empleador'),
(10, 'Intereses sobre las cesantías', 12.00, '%', 1, 2024, 'Empleador'),
(10, 'Vacaciones', 4.17, '%', 1, 2024, 'Empleador'),
(4, 'Caja de compensación familiar', 4.00, '%', 1, 2024, 'Empleador'),
(4, 'ICBF', 3.00, '%', 1, 2024, 'Empleador'),
(4, 'SENA', 2.00, '%', 1, 2024, 'Empleador'),
(8, 'Créditos', 0.00, 'COP', 1, 2024, 'Trabajador'),
(8, 'Libranzas', 0.00, 'COP', 1, 2024, 'Trabajador'),
(8, 'Convenios', 0.00, 'COP', 1, 2024, 'Trabajador'),
(8, 'Aporte voluntario Pensión', 0.00, 'COP', 1, 2024, 'Trabajador'),
(8, 'Seguro de vida', 0.00, 'COP', 1, 2024, 'Trabajador');


INSERT INTO ActionTypes (AtName) VALUES 
('Consulta'),
('Ejecutar Trigger'),
('Ejecutar Procedimiento Almacenado'),
('Insertar Datos'),
('Actualizar Datos'),
('Eliminar Datos'),
('Conceder Permisos'),
('Revocar Permisos');

INSERT INTO PositionStatus (PpStatus) VALUES 
('Activo'),
('Renuncia'),
('Ascendió'),
('Despedido');


INSERT INTO Employees (
    EmIdentificationType, EmIdentification, EmName, EmLastName, EmEmail, Emphone, 
    EmAddress, EmDateBrith, EmUsername, EmPassword, EmStatusId, EmUserRoleId, EmEps, EmPension, EmCaja, EmCesantias, EmArl
) VALUES 
-- Administrador
(1, '100000001', 'Jorge', 'Ruiz', 'admin@example.com', '3001234567', 
 'Calle 123 #45-67', '1993-06-15', 'admin', HASHBYTES('SHA2_256', 'Clave123'), 1, 2, 1, 1, 1, 1, 1),

-- Usuario Django (API)
(1, '100000002', 'Django', 'API', 'django@example.com', NULL, 
 NULL, '2000-01-01', 'django', HASHBYTES('SHA2_256', 'Clave123'), 1, 1, 1, 1, 1, 1, 1),

-- Otros empleados
(2, '100000003', 'Pedro', 'López', 'pedro.lopez@example.com', '3102345678', 
 'Carrera 12 #34-56', '1990-02-20', 'plopez', HASHBYTES('SHA2_256', 'Clave123'), 1, 3, 1, 1, 1, 1, 1),

(2, '100000004', 'Carlos', 'González', 'carlos.g@example.com', '3203456789', 
 'Avenida 45 #67-89', '1992-08-12', 'cgonzalez', HASHBYTES('SHA2_256', 'Clave123'), 1, 3, 1, 1, 1, 1, 1),

(2, '100000005', 'Ana', 'Martínez', 'ana.m@example.com', '3014567890', 
 'Calle 67 #89-12', '1988-11-05', 'amartinez', HASHBYTES('SHA2_256', 'Clave123'), 2, 3, 1, 1, 1, 1, 1),

(2, '100000006', 'Pedro', 'Ramírez', 'pedro.r@example.com', '3025678901', 
 'Carrera 23 #45-67', '1995-07-30', 'pramirez', HASHBYTES('SHA2_256', 'Clave123'), 2, 4, 1, 1, 1, 1, 1),

(2, '100000007', 'Luisa', 'Fernández', 'luisa.f@example.com', '3036789012', 
 'Diagonal 78 #90-12', '1993-04-18', 'lfernandez', HASHBYTES('SHA2_256', 'Clave123'), 1, 4, 1, 1, 1, 1, 1),

(2, '100000008', 'Javier', 'Sánchez', 'javier.s@example.com', '3047890123', 
 'Calle 34 #56-78', '1987-09-25', 'jsanchez', HASHBYTES('SHA2_256', 'Clave123'), 3, 5, 1, 1, 1, 1, 1),

(3, '100000009', 'Camila', 'Ortega', 'camila.o@example.com', '3058901234', 
 'Avenida 12 #34-56', '1998-12-10', 'cortega', HASHBYTES('SHA2_256', 'Clave123'), 3, 5, 1, 1, 1, 1, 1),

(3, '100000010', 'Ricardo', 'Morales', 'ricardo.m@example.com', '3069012345', 
 'Carrera 56 #78-90', '1984-03-22', 'rmorales', HASHBYTES('SHA2_256', 'Clave123'), 3, 6, 1, 1, 1, 1, 1),

(2, '100000011', 'Fernando', 'Castro', 'fernando.c@example.com', '3070123456', 
 'Calle 90 #12-34', '1991-05-14', 'fcastro', HASHBYTES('SHA2_256', 'Clave123'), 1, 3, 1, 1, 1, 1, 1),

(2, '100000012', 'Andrea', 'Ruiz', 'andrea.r@example.com', '3081234567', 
 'Carrera 78 #45-67', '1994-10-08', 'aruiz', HASHBYTES('SHA2_256', 'Clave123'), 2, 4, 1, 1, 1, 1, 1),

(2, '100000013', 'Manuel', 'Gutiérrez', 'manuel.g@example.com', '3092345678', 
 'Diagonal 34 #56-78', '1996-01-27', 'mgutierrez', HASHBYTES('SHA2_256', 'Clave123'), 1, 5, 1, 1, 1, 1, 1),

(2, '100000014', 'Patricia', 'Mejía', 'patricia.m@example.com', '3103456789', 
 'Transversal 23 #67-89', '1989-07-03', 'pmejia', HASHBYTES('SHA2_256', 'Clave123'), 1, 3, 1, 1, 1, 1, 1),

(2 , '100000015', 'Rodrigo', 'Vargas', 'rodrigo.v@example.com', '3114567890', 
 'Avenida 56 #78-90', '1993-11-15', 'rvargas', HASHBYTES('SHA2_256', 'Clave123'), 1, 6, 1, 1, 1, 1, 1);


INSERT INTO EmployeePosition (
    EpPositionId, EpEmployeeId, EpStartDate, EpEndDate, EpCurrentSalary, EpState
) VALUES 
(21, 1, '2024-01-01', NULL, 0.00, 1),  -- Administrador
(21, 2, '2024-02-15', NULL, 0.00, 1),  -- Django API User
(3, 3, '2023-05-10', NULL, 2000000.00, 1),  
(4, 4, '2022-11-20', NULL, 2000000.00, 1),  
(5, 5, '2021-09-05', NULL, 1500000.00, 1),  
(3, 6, '2023-03-14', NULL, 4800000.00, 1),  
(4, 7, '2022-07-28', NULL, 5100000.00, 1),  
(2, 8, '2023-12-01', NULL, 4700000.00, 1),  
(5, 9, '2020-08-19', NULL, 5300000.00, 1),  
(3, 10, '2024-02-01', NULL, 4900000.00, 1); 


INSERT INTO Contracts (
    CoContractTypeId, CoEmployeeId, CoEmployeePositionId, CoStartDate, CoEndDate
) VALUES 
(3, 3, 3, '2023-05-10', NULL),  
(4, 4, 4, '2022-11-20', NULL),  
(5, 5, 5, '2021-09-05', NULL),  
(3, 6, 6, '2023-03-14', NULL),  
(4, 7, 7, '2022-07-28', NULL),  
(2, 8, 8, '2023-12-01', NULL),  
(5, 9, 9, '2020-08-19', NULL),  
(3, 10, 10, '2024-02-01', NULL); 


INSERT INTO PayrollPayment (
    PyEmployeeId, PyPeriodId, PySalaryBase, PySalaryEarned, PySalaryNet, 
    PyTransportAux, PyTotalEarnings, PyTotalDeductions, PyTotalProvisioned, 
    PyAmount, PrDateSettlement, PyPaymentVoucher, PyDateVoucher, PyPayrollStatusId
) VALUES 
(3, 3, 2000000.00, 2450000.00, 2454000.00, 
 200000.00, 2650000.00, 196000.00, 1281401.45, 
 3931401.45, '2025-03-31', 'VCH-20250331-0001', '2025-03-31', 2),

 (4, 3, 2000000.00, 2450000.00, 2454000.00, 
 200000.00, 2650000.00, 196000.00, 1281401.45, 
 3931401.45, '2025-03-31', 'VCH-20250331-0002', '2025-03-31', 2);

GO


INSERT INTO Earnings (
    EaParametersId, EaEmployeeId, EaPaymentId, EaPeriodId, EaHours, EaAmount
) VALUES 
(10, 3, 1, 3, 30, 2000000.00),
(10, 4, 2, 3, 30, 2000000.00),
(11, 3, 1, 3, 30, 300000.00),
(11, 4, 2, 3, 30, 300000.00),
(11, 3, 1, 3, 13, 150000.00),
(11, 4, 2, 3, 13, 150000.00),
(9, 3, 1, 3, 13, 200000.00),
(9, 4, 2, 3, 13, 200000.00);
GO


INSERT INTO Deductions (
    DeParametersId, DeEmployeeId, DePaymentId, DePeriodId, DeAmount
) VALUES 
(20, 3, 1, 3, 98000.00),
(20, 4, 2, 3, 98000.00),
(22, 3, 1, 3, 98000.00),
(21, 3, 1, 3, 208250.00),
(23, 3, 1, 3, 294000.00),
(17, 3, 1, 3, 12789.00),
(24, 3, 1, 3, 220745.00),
(25, 3, 1, 3, 220745.00),
(26, 3, 1, 3, 2207.45),
(27, 3, 1, 3, 102165.00),
(28, 3, 1, 3, 98000.00),
(29, 3, 1, 3, 73500.00),
(30, 3, 1, 3, 49000.00),
(22, 4, 2, 3, 98000.00),
(21, 4, 2, 3, 208250.00),
(23, 4, 2, 3, 294000.00),
(17, 4, 2, 3, 12789.00),
(24, 4, 2, 3, 220745.00),
(25, 4, 2, 3, 220745.00),
(26, 4, 2, 3, 2207.45),
(27, 4, 2, 3, 102165.00),
(28, 4, 2, 3, 98000.00),
(29, 4, 2, 3, 73500.00),
(30, 4, 2, 3, 49000.00);

/* Insertar EPS en Colombia */
INSERT INTO Eps (EpName) VALUES 
('Nueva EPS'), 
('Sanitas EPS'), 
('Sura EPS'), 
('Compensar EPS'), 
('Coomeva EPS'), 
('Famisanar EPS'), 
('Salud Total EPS'), 
('Medimás EPS'), 
('EPS S.O.S'), 
('Capital Salud EPS');
GO

/* Insertar ARL en Colombia */
INSERT INTO Arl (ArName) VALUES 
('ARL Sura'), 
('ARL Positiva'), 
('ARL Colpatria'), 
('ARL Bolívar'), 
('ARL Colmena'), 
('ARL Mapfre'), 
('ARL Equidad'), 
('ARL Axa Colpatria'), 
('ARL Allianz'), 
('ARL Liberty');
GO

/* Insertar fondos de pensión en Colombia */
INSERT INTO Pension (PnName) VALUES 
('Colpensiones'), 
('Protección'), 
('Porvenir'), 
('Old Mutual'), 
('Skandia'), 
('Colfondos'), 
('Horizonte'), 
('BBVA Horizonte'), 
('Fondo Nacional del Ahorro'), 
('Pensiones Alfa');
GO

/* Insertar Cajas de Compensación en Colombia */
INSERT INTO Caja (CjName) VALUES 
('Compensar'), 
('Cafam'), 
('Colsubsidio'), 
('Comfenalco Antioquia'), 
('Comfenalco Valle'), 
('Comfandi'), 
('Cajacopi Atlántico'), 
('ComfaTolima'), 
('Comfacundi'), 
('Comfacor');
GO

/* Insertar fondos de cesantías en Colombia */
INSERT INTO Cesantias (CsName) VALUES 
('Protección'), 
('Porvenir'), 
('Colfondos'), 
('Skandia'), 
('Fondo Nacional del Ahorro'), 
('BBVA Horizonte'), 
('Cesantías Alfa'), 
('Pensiones y Cesantías Colpatria'), 
('Seguros Bolívar Cesantías'), 
('Cesantías Caja Social');
GO




-- -----------------------------------------------------------
-- -----------------------------------------------------------
-- RESTAURA VALIDACIÓN DE LLAVES MIENTRAS INSERTA
-- -----------------------------------------------------------
-- -----------------------------------------------------------

EXEC sp_MSforeachtable "ALTER TABLE ? CHECK CONSTRAINT ALL";
GO