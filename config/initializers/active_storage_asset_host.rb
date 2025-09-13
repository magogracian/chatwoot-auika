if ENV['STORAGE_ASSET_HOST'].present?
  Rails.application.config.after_initialize do
    Rails.application.config.active_storage.asset_host = ENV['STORAGE_ASSET_HOST']
    Rails.application.config.active_storage.resolve_model_to_route = :rails_storage_redirect
  end
end