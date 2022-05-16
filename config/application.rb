# frozen_string_literal: true

require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Shortay
  # Configuration for the application, engines, and railties goes here.
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 7.0
    # These settings can be overridden in specific environments using the files
    # in config/environments, which are processed later.
    config.hosts << 'www.example.com' # For testing, need to fix.
    # config.time_zone = "Central Time (US & Canada)"
    # config.eager_load_paths << Rails.root.join("extras")
    config.generators do |g|
      g.test_framework :rspec,
                       fixtures: true,
                       view_specs: false,
                       helper_specs: true,
                       routing_specs: true,
                       request_specs: true,
                       controller_specs: false
    end
  end
end
