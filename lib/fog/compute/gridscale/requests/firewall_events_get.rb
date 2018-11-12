module Fog
  module Compute
    class Gridscale
      class Real

        def firewall_events_get(firewall_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/firewalls/#{firewall_uuid}/events"
          )
        end

      end
    end
  end
end
