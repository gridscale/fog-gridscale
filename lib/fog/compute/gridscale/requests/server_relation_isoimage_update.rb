module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_isoimage_update(server_uuid, isoimage_uuid, payload)

          # create_options = {
          #
          # }
          # create_options[:bootdevice] = options[:bootdevice]

          encoded_body = Fog::JSON.encode(payload)
          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/servers/#{server_uuid}/isoimages/#{isoimage_uuid}",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
