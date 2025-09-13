Rails.application.configure do
  # Settings specified here will take precedence over those in config/application.rb.

  # Code is not reloaded between requests.
  config.cache_classes = true

  # Eager load code on boot.
  config.eager_load = true

  # Full error reports are disabled and caching is turned on.
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true

  # config.require_master_key = true

  # Disable serving static files from the `/public` folder by default since
  # Apache or NGINX already handles this.
  config.public_file_server.enabled = ActiveModel::Type::Boolean.new.cast(ENV.fetch('RAILS_SERVE_STATIC_FILES', true))
  config.public_file_server.headers = {
    'Cache-Control' => "public, max-age=#{1.year.to_i}"
  }

  # Compress JavaScripts and CSS.
  # config.assets.js_compressor = :uglifier
  # config.assets.css_compressor = :sass

  # Do not fallback to assets pipeline if a precompiled asset is missed.
  config.assets.compile = false

  # Enable serving of images, stylesheets, and JavaScripts from an asset server.
  config.action_controller.asset_host = ENV.fetch('ASSET_CDN_HOST') if ENV['ASSET_CDN_HOST'].present?

  # Store uploaded files on the local file system (see config/storage.yml for options)
  config.active_storage.service = ENV.fetch('ACTIVE_STORAGE_SERVICE', 'local').to_sym

  # Force all access to the app over SSL, use Strict-Transport-Security, and use secure cookies.
  config.force_ssl = ActiveModel::Type::Boolean.new.cast(ENV.fetch('FORCE_SSL', false))

  # Use the lowest log level to ensure availability of diagnostic information when problems arise.
  config.log_level = ENV.fetch('LOG_LEVEL', 'info').to_sym

  # Prepend all log lines with the following tags.
  config.log_tags = [:request_id]

  # Use a real queuing backend for Active Job (and separate queues per environment)
  config.active_job.queue_adapter = :sidekiq

  # Enable locale fallbacks for I18n
  config.i18n.fallbacks = [I18n.default_locale]

  # Send deprecation notices to registered listeners.
  config.active_support.deprecation = :notify

  # Use default logging formatter so that PID and timestamp are not suppressed.
  config.log_formatter = ::Logger::Formatter.new

  if ActiveModel::Type::Boolean.new.cast(ENV.fetch('RAILS_LOG_TO_STDOUT', true))
    logger           = ActiveSupport::Logger.new($stdout)
    logger.formatter = config.log_formatter
    config.logger    = ActiveSupport::TaggedLogging.new(logger)
  else
    config.logger    = ActiveSupport::Logger.new(
      Rails.root.join("log/#{Rails.env}.log"),
      1,
      ENV.fetch('LOG_SIZE', '1024').to_i.megabytes
    )
  end

  # Forzar a Active Storage a usar el host personalizado y no firmar URLs
  config.active_storage.resolve_model_to_route = :rails_storage_redirect
  config.active_storage.asset_host = ENV['STORAGE_ASSET_HOST']

  # Do not dump schema after migrations.
  config.active_record.dump_schema_after_migration = false

  config.action_mailer.perform_caching = false

  # Set this to appropriate ingress service
  config.action_mailbox.ingress = ENV.fetch('RAILS_INBOUND_EMAIL_SERVICE', 'relay').to_sym

  Rails.application.routes.default_url_options = { host: ENV['FRONTEND_URL'] }
end
