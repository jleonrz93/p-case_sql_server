DECLARE @Status INT, @Msg NVARCHAR(MAX), @ResultData NVARCHAR(MAX);
DECLARE @Result NVARCHAR(MAX);
DECLARE @ParamsUsr NVARCHAR(MAX);


SET @ParamsUsr = '{"UserId": 1,"Username2": "abc"}';

EXEC sp_ExecuteBusinessLogic 
    @UserName = 'admin',
	@Password = 'Clave123',
    @ProcedureName = 'sp_GetUserPermissions_JSON', 
    @Params = @ParamsUsr, 
    @StatusCode = @Status OUTPUT, 
    @Message = @Msg OUTPUT, 
    @ResultData = @Result OUTPUT;

PRINT 'Estado: ' + CAST(@Status AS NVARCHAR);
PRINT 'Mensaje: ' + @Msg;
PRINT 'Resultado: ' + ISNULL(@Result, 'Sin datos');

