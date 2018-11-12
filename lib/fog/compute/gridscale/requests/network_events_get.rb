module Fog
  module Compute
    class Gridscale
      class Real

        def network_events_get(network_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/networks/#{network_uuid}/events"
          )
        end

      end
    end
  end
end
