# Arquitectura de lógica de permisos y negocios

```mermaid
graph TD;

    subgraph Permisos

        A[UserPermissions] -->|Unir permisos con| B[RolePermission]

        B -->|Definir permisos finales| C[Permisos Usuario]

    end

  

    subgraph Lógica_de_Negocio

        D[Crear Empleado] --> E[Validar salario y cargo]

        E --> F[Insertar en tablas correspondientes]

        G[Actualizar Salario] --> H[Validar restricciones]

        H --> I[Actualizar registros]

        J[Liquidar Nómina] --> K[Calcular deducciones y devengados]

        K --> L[Actualizar estados]

    end

  

    subgraph Seguridad

        M[Validar contraseña] --> N[Aplicar reglas mínimas]

        O[Control de acceso] -->|WHERE en consultas| P[Filtrar datos]

    end

  

    Permisos -->|Determinar accesos| Lógica_de_Negocio

    Seguridad -->|Garantizar restricciones| Lógica_de_Negocio
```

flujo de la lógica para permisos

```mermaid
graph TD;

    A[Usuario] -->|Pertenece a| B[Roles]

    A -->|Tiene permisos directos| C[UserPermissions]

    B -->|Define permisos| D[RolePermissions]

    C -->|Se combinan con| D

    C & D -->|Definen accesos| E[Acceso a Tablas y Registros]

    E -->|Control en| F[Procedimientos Almacenados]

    E -->|Control en| G[Vistas]

    F & G -->|Ejecutan validaciones| H[Funciones]

    H -->|Validan restricciones| I[Disparadores]

    F -->|Ejecuta| J[Lógica de Negocio]

    style A fill:#f9f,stroke:#333,stroke-width:2px;

    style B fill:#ccf,stroke:#333,stroke-width:2px;

    style C fill:#fc9,stroke:#333,stroke-width:2px;

    style D fill:#fc9,stroke:#333,stroke-width:2px;

    style E fill:#9cf,stroke:#333,stroke-width:2px;

    style F fill:#cfc,stroke:#333,stroke-width:2px;

    style G fill:#cfc,stroke:#333,stroke-width:2px;

    style H fill:#ff9,stroke:#333,stroke-width:2px;

    style I fill:#f99,stroke:#333,stroke-width:2px;

    style J fill:#cfc,stroke:#333,stroke-width:2px;
```

El enfoque general es:
1. **Permisos a nivel de tabla**: se consultan en `UserPermissions` y `RolePermissions`
2. **Permisos a nivel de registro**: se aplican en consultas `WHERE` filtrando por `Username`
3. **Ejecución de procedimientos, funciones y vistas:** se validan los permisos antes de realizar las acciones