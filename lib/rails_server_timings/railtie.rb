require 'rails'
require 'rails_server_timings/middleware'

module RailsServerTimings
  class Railtie < Rails::Railtie
    config.server_timings = ActiveSupport::OrderedOptions.new
    config.server_timings.enabled = true

    initializer 'server_timings.middleware' do |app|
      if app.config.server_timings.enabled
        app.middleware.use RailsServerTimings::Middleware
      end
    end
  end
end
