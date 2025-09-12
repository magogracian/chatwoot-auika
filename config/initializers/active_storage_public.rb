# Cargar el servicio personalizado PublicS3Service al arrancar
require Rails.root.join("app/services/active_storage/service/public_s3_service.rb")
