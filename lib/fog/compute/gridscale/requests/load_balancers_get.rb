module Fog
  module Compute
    class Gridscale
      class Real
        def load_balancers_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/loadbalancers"
          )
        end
      end
    end
  end
end
