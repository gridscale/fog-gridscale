module Fog
  module Compute
    class Gridscale
      class Real

        def server_relation_storage_create(server_uuid, storage_uuid, options = {})

          create_options = {
              :object_uuid   => storage_uuid,

          }
          if options[:bootdevice]
            create_options[:bootdevice] = options[:bootdevice]
          end

          encoded_body = Fog::JSON.encode(create_options)
          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/servers/#{server_uuid}/storages",
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
