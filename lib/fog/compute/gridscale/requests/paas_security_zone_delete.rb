module Fog
  module Compute
    class Gridscale
      class Real
        def paas_security_zone_delete(paas_security_zone_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/paas/security_zones/#{paas_security_zone_uuid}",
              )
        end
      end
    end
  end
end
