from django.shortcuts import render
from django.http import JsonResponse
from rest_framework.decorators import api_view
from django.db import connection
import json


@api_view(['POST'])
def ejecutar_sp(request):
    try:
        user_name = request.data.get('UserName', 'admin')
        password = request.data.get('Password', '')
        procedure_name = request.data.get('ProcedureName', '')

        # Obtener los parámetros como string separado por comas
        params = request.data.get('Params', '')

        print("DEBUG: Datos recibidos en Django")  # 🔍 Depuración
        print(f"UserName: {user_name}, ProcedureName: {procedure_name}, Params: {params}")

        # Convertir `params` en JSON válido
        if isinstance(params, list) or isinstance(params, dict):
            params = json.dumps(params)  # Convertir a JSON string
        elif isinstance(params, str):
            try:
                # Si ya es JSON válido, lo dejamos igual
                json.loads(params)
            except json.JSONDecodeError:
                return JsonResponse({"error": "Params debe ser un JSON válido"}, status=400)



        with connection.cursor() as cursor:
            cursor.execute("""
                DECLARE @StatusCode INT, @Message NVARCHAR(MAX), @ResultData NVARCHAR(MAX);
                EXEC sp_ExecuteBusinessLogic 
                    @UserName=%s, 
                    @Password=%s, 
                    @ProcedureName=%s, 
                    @Params=%s, 
                    @StatusCode=@StatusCode OUTPUT, 
                    @Message=@Message OUTPUT, 
                    @ResultData=@ResultData OUTPUT;
                SELECT @StatusCode AS StatusCode, @Message AS Message, @ResultData AS ResultData;
            """, [user_name, password, procedure_name, params])

            result = cursor.fetchone()
            return JsonResponse({
                "StatusCode": result[0],
                "Message": result[1],
                "ResultData": result[2]
            })

    except Exception as e:
        return JsonResponse({"error": str(e)}, status=500)
