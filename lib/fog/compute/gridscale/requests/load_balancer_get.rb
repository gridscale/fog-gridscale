module Fog
  module Compute
    class Gridscale
      class Real

        def load_balancer_get(load_balancer_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/loadbalancers/#{load_balancer_uuid}"
          )
        end

      end
    end
  end
end
