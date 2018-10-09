module Fog
  module Compute
    class Gridscale
      class Real

        def network_update(network_uuid, payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/networks/#{network_uuid}",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
