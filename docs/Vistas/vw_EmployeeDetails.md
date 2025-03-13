## vw_EmployeeDetails

### Descripción de la Vista

La vista `vw_EmployeeDetails` centraliza y optimiza la consulta de información detallada sobre los empleados del sistema, incluyendo datos personales, de contacto, estado de usuario, información de seguridad social y el último cargo activo con su departamento correspondiente.

#### Tablas Involucradas

- **`Employees`**
- **`IdentificationType`**
- **`UserStatus`** 
- **`UserRoles`**
- **`Eps`**, **`Caja`**, **`Arl`**, **`Pension`**, **`Cesantias
- **`EmployeePosition`** 
- **`Positions`** 
- **`Departments`** 

#### Datos Retornados

| **Campo**            | **Descripción**                                                       |
| -------------------- | --------------------------------------------------------------------- |
| `COD`                | ID único del empleado.                                                |
| `TipoIdentificacion` | Tipo de documento de identificación.                                  |
| `Identificacion`     | Número de identificación del empleado.                                |
| `Nombre`             | Nombres del empleado.                                                 |
| `Apellido`           | Apellidos del empleado.                                               |
| `CorreoElectronico`  | Correo institucional o personal del empleado.                         |
| `TelefonoCelular`    | Número de teléfono del empleado.                                      |
| `Dirección`          | Dirección de residencia del empleado.                                 |
| `FechaNacimiento`    | Fecha de nacimiento del empleado.                                     |
| `Edad`               | Edad calculada del empleado.                                          |
| `Eps`                | Entidad Prestadora de Salud (EPS) a la que está afiliado el empleado. |
| `CajaCompensacion`   | Caja de compensación del empleado.                                    |
| `Arl`                | Administradora de Riesgos Laborales (ARL).                            |
| `Pension`            | Fondo de pensión del empleado.                                        |
| `Cesantias`          | Fondo de cesantías del empleado.                                      |
| `Departamento`       | Departamento en el que se encuentra el cargo actual.                  |
| `Cargo`              | Último cargo activo que ha ocupado el empleado.                       |
| `FechaInicio`        | Fecha de inicio del último cargo activo.                              |
| `FechaFin`           | Fecha de finalización del cargo (si aplica).                          |
| `EstadoEmpleado`     | Estado del cargo actual del empleado.                                 |
| `Username`           | Nombre de usuario en el sistema.                                      |
| `RolUsuario`         | Rol del usuario dentro del sistema.                                   |
| `EstadoUsuario`      | Estado actual del usuario (activo, inactivo, suspendido, etc.).       |

#### Consideraciones Técnicas

- Se usa **`OUTER APPLY`** para seleccionar el último cargo activo basado en la fecha de inicio (`EpStartDate`).
- Solo se toma en cuenta el cargo con estado activo (`EpState`).
- Se puede filtrar la vista para consultar un empleado en específico:

#### Uso

Ejemplo de uso

```sql
`SELECT * FROM vw_EmployeeDetails WHERE COD = @EmployeeId;`
```

### SQL

```sql
CREATE OR ALTER VIEW vw_EmployeeDetails AS
-- Información completa de un empleado con su último cargo activo y departamento
SELECT
	-- Información basica
    em.EmployeeId AS COD,
    it.IdType AS TipoIdentificacion,
    em.EmIdentification AS Identificacion,
    em.EmName AS Nombre,
    em.EmLastName AS Apellido,
    em.EmEmail AS CorreoElectronico,
    em.Emphone AS TelefonoCelular,
    em.EmAddress AS Dirección,
    em.EmDateBrith AS FechaNacimiento,
    DATEDIFF(YEAR, em.EmDateBrith, GETDATE()) - 
        CASE 
            WHEN (MONTH(em.EmDateBrith) > MONTH(GETDATE())) 
              OR (MONTH(em.EmDateBrith) = MONTH(GETDATE()) AND DAY(em.EmDateBrith) > DAY(GETDATE())) 
            THEN 1 
            ELSE 0 
        END AS Edad,

	-- Inforamción seguridad social
    ep.EpName AS Eps,
    ca.CjName AS CajaCompensacion,
    ar.ArName AS Arl,
    pe.PnName AS Pension,
    ce.CsName AS Cesantias,

	-- Informacion empleado
	dp.DeName AS Departamento,
    po.PoName AS Cargo,
	ep_actual.EpCurrentSalary AS SueldoBase,
	ep_actual.EpStartDate AS FechaInicio,
    ep_actual.EpEndDate AS FechaFin,
	ep_actual.PpStatus AS EstadoEmpleado,

	-- Informacion del usuario
    em.EmUsername AS Username,
    ur.RlName AS RolUsuario,
    us.StName AS EstadoUsuario

FROM Employees em
LEFT JOIN IdentificationType it ON em.EmIdentificationType = it.IdentificaciónTypeId
LEFT JOIN UserStatus us ON em.EmStatusId = us.StatusId
LEFT JOIN UserRoles ur ON em.EmUserRoleId = ur.RoleId
LEFT JOIN Caja ca ON em.EmCaja = ca.CajaId
LEFT JOIN Eps ep ON em.EmEps = ep.EpsId
LEFT JOIN Arl ar ON em.EmArl = ar.ArlId
LEFT JOIN Pension pe ON em.EmPension = pe.PensionId
LEFT JOIN Cesantias ce ON em.EmCesantias = ce.CesantiasId

-- Obtener el último cargo activo
OUTER APPLY (
    SELECT TOP 1 ep.EpPositionId, ep.EpStartDate, ep.EpEndDate, pos.PpStatus, ep.EpCurrentSalary
    FROM EmployeePosition ep
	LEFT JOIN PositionStatus pos ON ep.EpState = pos.PositionStatusId
    WHERE ep.EpEmployeeId = em.EmployeeId
    ORDER BY ep.EpStartDate DESC
) ep_actual

LEFT JOIN Positions po ON ep_actual.EpPositionId = po.PositionId
LEFT JOIN Departments dp ON po.PoDepartmentID = dp.DepartmentId

-- WHERE em.EmployeeId = @EmployeeId;  -- Filtrar por empleado si es necesario
GO
```