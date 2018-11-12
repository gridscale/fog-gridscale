module Fog
  module Compute
    class Gridscale
      class Real

        def load_balancers_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/loadbalancers",
              :query   => filters
          )
        end

      end
    end
  end
end
