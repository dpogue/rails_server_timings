require 'rails'
require 'rails_server_timings/controller_runtime'

module RailsServerTimings
  class Railtie < Rails::Railtie
    config.server_timings = ActiveSupport::OrderedOptions.new
    config.server_timings.enabled = true

    initializer 'server_timings.subscribe' do |app|
      if app.config.server_timings.enabled
        ActiveSupport.on_load(:action_controller) do
          include RailsServerTimings::ControllerRuntime
        end
      end
    end
  end
end
