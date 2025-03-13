## vw_UserPayroll

### Descripción de la Vista

La vista `vw_UserPayroll` proporciona una visualización de la liquidación de nomina de un Empleado.


```sql

CREATE VIEW vw_UserPayroll AS
SELECT 
	pp.PrYear AS Año,
	pp.PrMont AS Mes,
	py.PySalaryBase AS SalarioBase,
	py.PySalaryNet AS SalarioNeto,
	py.PyTransportAux As AuxTransporte,
	py.PyTotalEarnings AS TotalDevengado,
	py.PyTotalDeductions AS TotalDeducido,
	py.PrDateSettlement AS FechaLiquidado,
	py.PyPaymentVoucher AS Comprobante,
	ps.PsName as Estado

FROM
PayrollPayment py
LEFT JOIN PayrollPeriod pp ON py.PyPeriodId = pp.PeriodId
LEFT JOIN PayrollStatus ps ON py.PyPayrollStatusId = ps.PayrollStatusId
-- WHERE py.PyEmployeeId = 3

```