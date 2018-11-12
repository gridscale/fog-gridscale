module Fog
  module Compute
    class Gridscale
      class Real
        def ips_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/ips",
              :query   => filters

          )
        end
      end
    end
  end
end
