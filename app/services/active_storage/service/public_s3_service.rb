require "active_storage/service/s3_service"

class ActiveStorage::Service::PublicS3Service < ActiveStorage::Service::S3Service
  # URL directa para cualquier archivo
  def url(key, **_options)
    "#{@client.config.endpoint}/#{@bucket.name}/#{key}"
  end

  # También usar URL directa para variantes/miniaturas
  def url_for_variant(key, **_options)
    url(key)
  end

  # También para subidas directas (aunque Chatwoot no las usa)
  def url_for_direct_upload(key, **_options)
    url(key)
  end

  def public?
    true
  end
end
