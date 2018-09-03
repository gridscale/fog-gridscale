module Fog
  module Compute
    class Gridscale
      class Real
        def ip_events_get(ip_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/ips/#{ip_uuid}/events"
          )
        end
      end
    end
  end
end
