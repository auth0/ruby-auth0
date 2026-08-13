# frozen_string_literal: true

require_relative "boot"
require "action_controller/railtie"

Bundler.require(*Rails.groups)

module Auth0RailsApiExample
  class Application < Rails::Application
    config.load_defaults 7.1
    config.api_only = true
    config.secret_key_base = ENV.fetch("SECRET_KEY_BASE", "dev-secret-#{SecureRandom.hex(32)}")
    config.eager_load = false
    config.logger = Logger.new($stdout)
  end
end
