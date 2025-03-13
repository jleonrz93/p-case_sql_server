from django.urls import path
# from .views import ExecuteProcedureAPI
from .views import ejecutar_sp

urlpatterns = [
    # path('api/execute/', ExecuteProcedureAPI.as_view(), name='api_execute_procedure'),
    path('ejecutar_sp/', ejecutar_sp, name='ejecutar_sp'),
]
