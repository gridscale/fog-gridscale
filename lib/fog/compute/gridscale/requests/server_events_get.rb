module Fog
  module Compute
    class Gridscale
      class Real
        def server_events_get(server_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/events"
          )
        end
      end
    end
  end
end
