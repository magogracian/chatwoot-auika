FROM ghcr.io/railwayapp-templates/chatwoot:community

# Copiar tu archivo sobre el original dentro del contenedor
COPY config/environments/production.rb /app/config/environments/production.rb