if ENV['STORAGE_ASSET_HOST'].present?
  Rails.application.config.after_initialize do
    host = ENV['STORAGE_ASSET_HOST']
    Rails.application.config.active_storage.asset_host = host
    Rails.application.config.action_controller.asset_host = host
    Rails.application.config.active_storage.resolve_model_to_route = :rails_storage_redirect
  end
end
