from rest_framework import serializers

class EjecutarSPSerializer(serializers.Serializer):
    UserName = serializers.CharField(max_length=100)
    Password = serializers.CharField(max_length=100)
    ProcedureName = serializers.CharField(max_length=255)
    Params = serializers.JSONField(required=False)  
