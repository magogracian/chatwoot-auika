require "active_storage/service/s3_service"

class ActiveStorage::Service::PublicS3Service < ActiveStorage::Service::S3Service
  # Usar URL directa en lugar de firmada
  def url(key, **)
    File.join(@client.config.endpoint.to_s, @bucket.name, key)
  end

  def public?
    true
  end
end
