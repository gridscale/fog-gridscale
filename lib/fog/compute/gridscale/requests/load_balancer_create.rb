module Fog
  module Compute
    class Gridscale
      class Real
        def load_balancer_create(payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/loadbalancers',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
