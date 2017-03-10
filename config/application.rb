require_relative 'boot'

require "rails"
# Pick the frameworks you want:
require "active_model/railtie"
require "active_job/railtie"
require "active_record/railtie"
require "action_controller/railtie"
require "action_mailer/railtie"
require "action_view/railtie"
require "action_cable/engine"
require "sprockets/railtie"
# require "rails/test_unit/railtie"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module Bakaapi
  class Application < Rails::Application
    config.time_zone = 'UTC'

    config.active_job.queue_adapter = :sidekiq
    config.cache_store = :redis_store, ENV['REDIS_URL'], { namespace: 'bakaapi', expires_in: 1.day }

    config.autoload_paths << Rails.root.join('lib')
    config.eager_load_paths += Dir[Rails.root.join('app', '*', 'concerns')]

    config.middleware.insert_before 0, 'Rack::Cors' do
      allow do
        origins '*'
        resource '*', {
          headers: :any,
          methods: :any,
          credentials: false,
          max_age: 1.hour
        }
      end
    end
  end
end
