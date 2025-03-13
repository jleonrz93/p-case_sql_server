from django.http import JsonResponse
from rest_framework.decorators import api_view
from django.db import connection
import json
from .serializers import EjecutarSPSerializer

@api_view(['POST'])
def ejecutar_sp(request):
    try:
        # Validar los datos con el serializer
        serializer = EjecutarSPSerializer(data=request.data)
        if not serializer.is_valid():
            return JsonResponse(serializer.errors, status=400)

        # Extraer los datos validados
        user_name = serializer.validated_data.get('UserName')
        password = serializer.validated_data.get('Password', '')
        procedure_name = serializer.validated_data.get('ProcedureName')
        params = serializer.validated_data.get('Params', {})

        print("DEBUG: Datos recibidos en Django")  # 🔍 Depuración
        print(f"UserName: {user_name}, ProcedureName: {procedure_name}, Params: {params}")

        # Convertir `params` a JSON string si es necesario
        params = json.dumps(params)

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
