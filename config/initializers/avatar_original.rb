Rails.application.config.to_prepare do
  module Avatarable
    def avatar_url
      return nil unless avatar.attached?

      # Usar el archivo original directamente (sin representación/miniatura)
      Rails.application.routes.url_helpers.url_for(avatar.blob)
    end
  end
end
