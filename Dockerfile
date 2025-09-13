FROM ghcr.io/railwayapp-templates/chatwoot:community

# Sobrescribe el archivo de configuración de producción
COPY config/environments/production.rb /app/config/environments/production.rb