require "active_storage/service/s3_service"

class ActiveStorage::Service::PublicS3Service < ActiveStorage::Service::S3Service
  # URL directa (sin firma)
  def url(key, **_options)
    "#{@client.config.endpoint}/#{@bucket.name}/#{key}"
  end

  # Para representaciones (miniaturas)
  def url_for_direct_upload(key, **_options)
    url(key)
  end

  def public?
    true
  end
end
