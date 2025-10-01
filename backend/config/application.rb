# Load the Rails boot file (sets up Bundler, etc.)
require_relative 'boot'

# Require the frameworks we want to use (API mode disables views, assets, etc.)
require "rails"
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"      # Database ORM
require "action_controller/railtie"  # Controllers for API
require "action_mailer/railtie"      # Email (optional, but often needed)
require "action_view/railtie"        # Views (not used in API mode, but required by some gems)
require "action_cable/engine"        # WebSockets (optional)
require "rails/test_unit/railtie"    # Test framework

# Load all gems from Gemfile, respecting groups (test, development, production)
Bundler.require(*Rails.groups)

module Backend
  class Application < Rails::Application
    # Use Rails 7.1 defaults for configuration
    config.load_defaults 7.1

    # API-only mode: disables views, assets, cookies, etc. for a lighter app
    config.api_only = true

    # CORS (Cross-Origin Resource Sharing) configuration
    # Allows requests from any origin (for development; restrict in production!)
    config.middleware.insert_before 0, Rack::Cors do
      allow do
        origins '*'
        resource '*', headers: :any, methods: [:get, :post, :put, :patch, :delete, :options, :head]
      end
    end
  end
end
