module Fog
  module Compute
    class Gridscale
      class Real
        def paas_security_zone_get(paas_security_zone_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/paas/security_zones/#{paas_security_zone_uuid}"
          )
        end
      end
    end
  end
end
