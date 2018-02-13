module RailsServerTimings
  module ControllerRuntime
    def process_action(*args)
      callback = lambda do |*_|
        event = ActiveSupport::Notifications::Event.new(*_)
        payload = event.payload
        timings = []

        payload.each do |key, value|
          if key.to_s =~ /\w+_runtime$/
            timings << ("#{key.to_s.chomp('_runtime')}; dur=%.3f" % value.to_f)
          end
        end

        timings << ('total; dur=%.3f' % event.duration.to_f)

        response.headers['Server-Timing'] = timings.join(', ')
      end


      ActiveSupport::Notifications.subscribed(callback, 'process_action.action_controller') do
        super
      end
    end
  end
end
