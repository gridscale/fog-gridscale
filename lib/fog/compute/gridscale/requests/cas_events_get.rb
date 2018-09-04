module Fog
  module Compute
    class Gridscale
      class Real
        def cas_events_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/cas/events"
          )
        end
      end
    end
  end
end
