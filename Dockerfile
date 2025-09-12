FROM ghcr.io/railwayapp-templates/chatwoot:community

# Instalar dependencias necesarias para procesamiento de imágenes
RUN apk add --no-cache ca-certificates build-base vips vips-dev fftw-dev

WORKDIR /app