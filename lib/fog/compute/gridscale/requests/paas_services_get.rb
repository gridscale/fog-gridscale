module Fog
  module Compute
    class Gridscale
      class Real

        def paas_services_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/paas/services",
              :query   => filters
          )
        end

      end
    end
  end
end
