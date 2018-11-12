module Fog
  module Compute
    class Gridscale
      class Real

        def load_balancer_update(load_balancer_uuid, payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/loadbalancers/#{load_balancer_uuid}",
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
