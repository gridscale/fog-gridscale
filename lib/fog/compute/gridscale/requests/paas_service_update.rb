module Fog
  module Compute
    class Gridscale
      class Real

        def paas_service_update(paas_service_uuid, payload={})

          encoded_body = Fog::JSON.encode(payload)


          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/paas/services/#{paas_service_uuid}",
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
