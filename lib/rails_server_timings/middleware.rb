
module RailsServerTimings
  class Middleware
    def initialize(app)
      @app = app
    end

    def call(env)
      timings = []

      callback = lambda do |*_|
        event = ActiveSupport::Notifications::Event.new(*_)
        payload = event.payload

        payload.each do |key, value|
          if key.to_s =~ /\w+_runtime$/
            timings << ("#{key.to_s.chomp('_runtime')}; dur=%.3f" % value.to_f)
          end
        end

        timings << ('total; dur=%.3f' % event.duration.to_f)
      end

      ActiveSupport::Notifications.subscribed(callback, 'process_action.action_controller') do
        status, headers, body = @app.call(env)

        headers['Server-Timing'] = timings.join(', ')

        [status, headers, body]
      end
    end
  end
end
