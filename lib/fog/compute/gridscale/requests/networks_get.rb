module Fog
  module Compute
    class Gridscale
      class Real

        def networks_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/networks",
              :query   => filters
          )
        end

      end
    end
  end
end
