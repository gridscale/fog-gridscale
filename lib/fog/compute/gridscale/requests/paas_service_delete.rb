module Fog
  module Compute
    class Gridscale
      class Real
        def paas_service_delete(paas_service_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/paas/services/#{paas_service_uuid}",
              )
        end
      end
    end
  end
end
