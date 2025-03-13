from rest_framework import serializers

class ExecuteProcedureSerializer(serializers.Serializer):
    username = serializers.CharField(max_length=100)
    procedure_name = serializers.CharField(max_length=255)
    params = serializers.JSONField(required=False)  
