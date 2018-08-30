module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_network_update(server_uuid, network_uuid, options = {})

          create_options = {

          }
          create_options[:bootdevice] = options[:bootdevice]

          encoded_body = Fog::JSON.encode(create_options)
          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/servers/#{server_uuid}/networks/#{network_uuid}",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
