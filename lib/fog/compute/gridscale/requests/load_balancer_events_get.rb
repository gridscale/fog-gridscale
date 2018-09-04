module Fog
  module Compute
    class Gridscale
      class Real
        def load_balancer_events_get(load_balancer_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/loadbalancers/#{load_balancer_uuid}/events"
          )
        end
      end
    end
  end
end
