require Rails.root.join("config/mail")
Rails.application.configure do
  # if ENV.fetch("HEROKU_APP_NAME", "").include?("staging-pr-")
  #   ENV["CURRENT_DOMAIN"] = ENV["HEROKU_APP_NAME"] + ".herokuapp.com"
  # end
  config.middleware.use Rack::CanonicalHost, ENV.fetch("CURRENT_DOMAIN")
  config.cache_classes = true
  config.eager_load = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_files = ENV['RAILS_SERVE_STATIC_FILES'].present?
  config.middleware.use Rack::Deflater
  config.assets.js_compressor = :uglifier
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :debug
  config.action_controller.asset_host = ENV.fetch("ASSET_HOST", ENV.fetch("CURRENT_DOMAIN"))
  config.action_mailer.delivery_method = :smtp
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.log_formatter = ::Logger::Formatter.new
  config.active_record.dump_schema_after_migration = false
  config.action_mailer.default_url_options = { host: ENV.fetch("CURRENT_DOMAIN") }
end
Rack::Timeout.timeout = (ENV["RACK_TIMEOUT"] || 10).to_i
