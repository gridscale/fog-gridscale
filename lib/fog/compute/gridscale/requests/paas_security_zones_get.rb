module Fog
  module Compute
    class Gridscale
      class Real

        def paas_security_zones_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/paas/security_zones",
              :query   => filters
          )
        end

      end
    end
  end
end
