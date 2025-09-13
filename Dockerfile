FROM ghcr.io/railwayapp-templates/chatwoot:community

# Sobrescribe el archivo de configuración existente
COPY config/environments/production.rb /app/config/environments/production.rb

# Agrega el nuevo initializer (o lo sobrescribe si en el futuro llegara a existir)
COPY config/initializers/active_storage_asset_host.rb /app/config/initializers/active_storage_asset_host.rb