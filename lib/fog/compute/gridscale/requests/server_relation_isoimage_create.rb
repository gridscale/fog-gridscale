module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_isoimage_create(server_uuid, isoimage_uuid)

          create_options = {
              :object_uuid   => isoimage_uuid,

          }

          encoded_body = Fog::JSON.encode(create_options)
          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/servers/#{server_uuid}/isoimages",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
