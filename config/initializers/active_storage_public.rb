Rails.application.config.after_initialize do
  ActiveStorage::Service.url_expires_in = 10.years # casi infinito, opcional

  if ActiveStorage::Blob.service.name.to_s == "s3_compatible"
    ActiveStorage::Blob.service.singleton_class.class_eval do
      def public?
        true
      end
    end
  end
end
