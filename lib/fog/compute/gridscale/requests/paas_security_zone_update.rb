module Fog
  module Compute
    class Gridscale
      class Real

        def paas_security_zone_update(paas_security_zone_uuid, payload={})

          encoded_body = Fog::JSON.encode(payload)


          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/paas/security_zones/#{paas_security_zone_uuid}",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
