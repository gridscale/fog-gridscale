module Fog
  module Compute
    class Gridscale
      class Real
        def firewall_get(firewall_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/firewalls/#{firewall_uuid}"
          )
        end
      end
    end
  end
end
