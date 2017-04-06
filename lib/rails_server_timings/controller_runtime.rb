module RailsServerTimings
  module ControllerRuntime
    def process_action(*args)
      callback = lambda do |*_|
        event = ActiveSupport::Notifications::Event.new(*_)
        payload = event.payload
        timings = []

        factor = 1.0

        # Chrome 57 and lower interpret the header in seconds instead of
        # milliseconds, so we need to divide all the results by a factor of
        # 1000
        if match = request.user_agent.match(/Chrome\/(\d+)/)
          factor = 0.0001 if match[1] and match[1].to_i < 58
        end

        payload.each do |key, value|
          if idx = key.to_s =~ /_runtime/
            timings << ("#{key[0, idx]}=%.3f" % (value.to_f * factor))
          end
        end

        timings << ('total=%.3f' % (event.duration.to_f * factor))

        response.headers['Server-Timing'] = timings.join(', ')
      end


      ActiveSupport::Notifications.subscribed(callback, 'process_action.action_controller') do
        super
      end
    end
  end
end
