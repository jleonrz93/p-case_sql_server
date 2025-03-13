## vw_UserPermissions_Details

### Descripción de la Vista

La vista `vw_UserPermissions_Details` proporciona una representación consolidada de los permisos asignados a cada usuario dentro del sistema. Integra los permisos heredados por rol y los permisos asignados directamente a los usuarios, mostrando una visión clara de qué acciones pueden realizar sobre qué tablas.

#### Tablas Involucradas

- **`Employees`**
- **`SystemTables`** 
- **`PermissionsType`** 
- **`RolePermissions`** 
- **`UserPermissions`** 

#### Datos Retornados

| **Campo**            | **Descripción**                                                        |
| -------------------- | ---------------------------------------------------------------------- |
| `UserId`             | ID único del empleado / usuario.                                       |
| `UserName`           | Nombre de usuario en el sistema.                                       |
| `TableId`            | ID de la tabla sobre la cual se otorgan permisos.                      |
| `TableName`          | Nombre de la tabla afectada por el permiso.                            |
| `PermissionTypeId`   | ID del tipo de permiso asignado.                                       |
| `PermissionTypeName` | Nombre del tipo de permiso asignado.                                   |
| `IsAllowed`          | Indica si el permiso está activo (1) o denegado (0).                   |
| `Estado`             | Descripción legible del estado del permiso: `"Activo"` o `"Denegado"`. |

#### Consideraciones Técnicas

- Los permisos pueden provenir de dos fuentes,
- Si un usuario tiene permiso denegado en `UserPermissions` se respetará la restricción, incluso si el rol lo permite.
- Se usa `COALESCE` para manejar los casos en lo que un usuario solo tenga permisos por rol o por asignación directa.
- Se usa `FULL OUTER JOIN` para asegurarse que todos los casos sean considerados.

#### Uso

Ejemplo de uso

```sql
SELECT * FROM vw_UserPermissions WHERE UserId = @EmployeeId;`
```

### SQL

```sql

CREATE VIEW vw_UserPermissions_Details AS
WITH PermissionsBasedRole AS(	
	-- Obtener Permisos de Usuario por ROl
	SELECT 
		e.EmployeeId AS UserId,
		rp.RpTableId AS TableId,
		rp.RpTypeId AS PermissionTypeId,
		rp.RpActive AS AllowedByRole
	FROM Employees e
	INNER JOIN RolePermissions rp ON e.EmUserRoleId = rp.RpRoleId
),
PermmissionsBaseUser AS (
	-- Obtener Permisos de Usuario por Usuario

	SELECT 
		up.UrEmployeeId AS UserId,
		up.UrTableId AS TableId,
		up.UrTypeId AS PermissionTypeId,
		up.UrActive AS AllowedByUser
	FROM UserPermissions up
)

-- Unificar los permisos del usuario
SELECT
	COALESCE(pbr.UserID, pbu.UserID) AS UserId,
	em.EmUsername AS UserName,
    COALESCE(pbr.TableID, pbu.TableID) AS TableId,
	COALESCE(st.TaName, 'Desconocido') AS TableName,
    COALESCE(pbr.PermissionTypeId, pbu.PermissionTypeId) AS PermissionTypeId,
	COALESCE(pt.PtName, 'Desconocido') AS PermissionTypeName,
	CASE 
        WHEN pbu.AllowedByUser = 0 THEN 0 -- Si el usuario tiene un permiso denegado, se niega
        WHEN pbr.AllowedByRole = 1 OR pbu.AllowedByUser = 1 THEN 1 -- Si tiene permiso por rol o usuario, se permite
        ELSE 0 -- Si no tiene permisos en ninguna tabla, se niega
    END AS IsAllowed,
	CASE 
        WHEN pbu.AllowedByUser = 0 THEN 'Denegado' -- Si el usuario tiene un permiso denegado, se niega
        WHEN pbr.AllowedByRole = 1 OR pbu.AllowedByUser = 1 THEN 'Activo' -- Si tiene permiso por rol o usuario, se permite
        ELSE 'Denegado' -- Si no tiene permisos en ninguna tabla, se niega
    END AS Estado

FROM PermissionsBasedRole pbr 
	FULL OUTER JOIN PermmissionsBaseUser pbu
		ON pbr.UserId = pbu.UserId
		AND	pbr.TableId = pbu.TableId
		AND	pbr.PermissionTypeId = pbu.PermissionTypeId
LEFT JOIN SystemTables st 
	ON COALESCE(pbr.TableId, pbu.TableId) = st.TableId
LEFT JOIN Employees em 
	ON COALESCE(pbr.UserID, pbu.UserID) = em.EmployeeId
LEFT JOIN PermissionsType pt 
	ON COALESCE(pbr.PermissionTypeId, pbu.PermissionTypeId) = pt.PermissionTypeId
-- WHERE COALESCE(pbr.UserID, pbu.UserID) = 3;

```