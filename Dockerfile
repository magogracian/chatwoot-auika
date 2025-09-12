# Dockerfile
FROM ghcr.io/railwayapp-templates/chatwoot:community

# Herramientas y certificados (base Alpine)
RUN apk add --no-cache ca-certificates build-base

# Actualiza solo aws-sdk-s3 dentro de la imagen
WORKDIR /app
RUN bundle update aws-sdk-s3 && bundle clean --force
