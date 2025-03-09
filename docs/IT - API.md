# Implementación Técnica - API
## API en Django

### 1. Modelo de Conexión a SQL Server
```python
DATABASES = {
    'default': {
        'ENGINE': 'mssql',
        'NAME': 'NombreBD',
        'USER': 'usuario_sql',
        'PASSWORD': 'password',
        'HOST': 'servidor_sql',
        'PORT': '1433',
        'OPTIONS': {
            'driver': 'ODBC Driver 17 for SQL Server',
        },
    }
}
```

