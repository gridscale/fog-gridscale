module Fog
  module Compute
    class Gridscale
      class Real

        def ip_update(ip_uuid, payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/ips/#{ip_uuid}",
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
