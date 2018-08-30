module Fog
  module Compute
    class Gridscale
      class Real
        def server_power_off(server_uuid)
          body = { :power => false }

          encoded_body = Fog::JSON.encode(body)

          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/servers/#{server_uuid}/power",
              :body    => encoded_body,
              )
        end
      end

    end
  end
end
