FROM ghcr.io/railwayapp-templates/chatwoot:community

RUN apk add --no-cache ca-certificates build-base vips vips-dev fftw-dev

WORKDIR /app
RUN bundle update aws-sdk-s3 && bundle clean --force
