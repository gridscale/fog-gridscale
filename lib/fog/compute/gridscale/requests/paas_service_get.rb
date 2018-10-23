module Fog
  module Compute
    class Gridscale
      class Real
        def paas_service_get(paas_service_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/paas/services/#{paas_service_uuid}"
          )
        end
      end
    end
  end
end
