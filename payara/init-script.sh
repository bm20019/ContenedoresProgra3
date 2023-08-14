#!/bin/bash

# Variables de configuración
POOL_NAME="pg_localhost_parqueo"
JDBC_RESOURCE_NAME="jdbc/pgdb"
DB_USER="postgres"
DB_PASSWORD="abc123"
DB_SERVER="localhost"
DB_PORT="5432"
DB_NAME="parqueo"
CREATED_FLAG="created"

/opt/payara/appserver/bin/asadmin start-domain
# Verificar si el archivo "created" existe
if [ -f "$CREATED_FLAG" ]; then
    /opt/payara/appserver/bin/asadmin ping-connection-pool "$POOL_NAME"
    echo "Pool correcto"
else
    # Crear el pool de conexión
    /opt/payara/appserver/bin/asadmin create-jdbc-connection-pool \
        --datasourceclassname org.postgresql.ds.PGSimpleDataSource \
        --restype javax.sql.DataSource \
        --property user="$DB_USER":password="$DB_PASSWORD":servername="$DB_SERVER":portnumber="$DB_PORT":databasename="$DB_NAME" \
        "$POOL_NAME"
    
    # Probar la conectividad del pool de conexión
    if /opt/payara/appserver/bin/asadmin ping-connection-pool "$POOL_NAME"; then
        # Crear el recurso JDBC
        /opt/payara/appserver/bin/asadmin create-jdbc-resource --connectionpoolid "$POOL_NAME" "$JDBC_RESOURCE_NAME"
        
        # Crear el archivo "created" para indicar que el proceso se ha completado
        touch "$CREATED_FLAG"
        
        echo "Configuración completada y archivo \"$CREATED_FLAG\" creado."
    else
        echo "Error al crear el pool de conexión."
    fi
fi
