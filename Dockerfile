FROM ghcr.io/railwayapp-templates/chatwoot:community

# Dependencias del sistema (incluye libvips para procesar imágenes)
RUN apk add --no-cache ca-certificates build-base vips vips-dev fftw-dev

WORKDIR /app

# Asegura que existan las rutas de destino antes de copiar
RUN mkdir -p /app/app/services/active_storage/service \
    && mkdir -p /app/config/initializers

# Copia tu servicio personalizado y configuraciones dentro de la app
COPY app/services/active_storage/service/public_s3_service.rb /app/app/services/active_storage/service/public_s3_service.rb
COPY config/storage.yml /app/config/storage.yml
COPY config/initializers/active_storage_public.rb /app/config/initializers/active_storage_public.rb

# Mantén aws-sdk-s3 actualizado
RUN bundle update aws-sdk-s3 && bundle clean --force
