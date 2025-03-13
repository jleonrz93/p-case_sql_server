## sp_GetUserPermissions

A través de la vista `vw_UserPermissions_Details` obtiene los permisos de un usuario determinado

Parámetros JSON necesarios

- `UserId`: Id de usuario que se quiere consultar

Retorna:

- `JsonResponse`: JSON con el resultado de la consulta
- `StatusCode`: Cogido estado de la operación. 
- `Message`: Mensaje asociado al código de ayuda.

```sql
CREATE OR ALTER PROCEDURE sp_GetUserPermissions_JSON
    @Params NVARCHAR(MAX),
    @JsonResponse NVARCHAR(MAX) OUTPUT,
	@StatusCode INT OUTPUT,
	@Message NVARCHAR(255) OUTPUT
AS
BEGIN
    SET NOCOUNT ON;

	DECLARE @UserIdCon INT;
	DECLARE @SqlStatementCon NVARCHAR(MAX);
	DECLARE @SqlStatementProd NVARCHAR(MAX);
	DECLARE @RequiredParams NVARCHAR(MAX);
	DECLARE @MissingParams NVARCHAR(MAX);
	DECLARE @StatusCodePer INT;

	DECLARE @JsonResult NVARCHAR(MAX);

	-- SET @RequiredParams = '["UserId"]';
	SET @RequiredParams = '["UserId"]';
	

	-- Inicializar la variable JSON con un valor por defecto
    SET @JsonResponse = '{"No hay datos para mostrar."}';
	SET @StatusCode = 900
	SET @Message = 'Error desconocido.';



	-- Validar los parametros necesarios
	-- -------------------------------------------------------
	
	SET @MissingParams = (
        SELECT STRING_AGG(value, ', ') 
        FROM OPENJSON(@RequiredParams)
        WHERE value NOT IN (SELECT [key] FROM OPENJSON(@Params))
    );
	
	-- Si faltan parámetros, devolver mensaje de error
    IF @MissingParams IS NOT NULL
    BEGIN
		SET @StatusCode = 401
        SET @Message = 'Faltan los siguientes parámetros: ' + @MissingParams;

		-- Log PROC_FALTA_PARAMETRO
		EXEC sp_LogAction 
			@ActionTypeId = 3, 
			@Parameters = 'sp_GetUserPermissions_JSON', 
			@AdditionalInfo = @Params;

        RETURN;
    END;
	

	-- Preparar acción
	-- -------------------------------------------------------   

	 -- Extraer valores del JSON recibido
    SET @UserIdCon = JSON_VALUE(@Params, '$.UserId');

	-- Construir la consulta
    SET @SqlStatementProd = 'SELECT * FROM vw_UserPermissions_Details WHERE UserId = ' + CAST(@UserIdCon AS NVARCHAR) + ' FOR JSON AUTO';

	SET @SqlStatementCon = N'
        SELECT @JsonResult = ('
            + @SqlStatementProd +
        ');
    ';


	-- Validar si tiene permisos
	-- ------------------------------------------------------

    EXEC sp_CheckUserPermissions 
		@SqlStatement = @SqlStatementProd, 
		@StatusCode = @StatusCodePer OUTPUT, 
		@Message = @Message OUTPUT;

	IF @StatusCodePer <> 303
	BEGIN
		SET @StatusCode = @StatusCodePer;
		SET @Message = @Message;
		RETURN;
	END


	
	-- Realiza la acción
	-- -----------------------------------------------------
	
	EXEC sp_executesql 
        @SqlStatementCon,
        N'@UserIdCon INT, @JsonResult NVARCHAR(MAX) OUTPUT',
        @UserIdCon = @UserIdCon,
        @JsonResult = @JsonResult OUTPUT;
	
	
	-- PRINT @JsonResult;


	SET @StatusCode = 100;
	SET @Message = 'Tarea ejecutada sin novedades';
	SET @JsonResponse = @JsonResult;

	-- Log PROC_EJECUTADO
	EXEC sp_LogAction 
		@ActionTypeId = 4, 
		@Parameters = 'sp_GetUserPermissions_JSON', 
		@AdditionalInfo = @JsonResult;
	
END;
GO

```