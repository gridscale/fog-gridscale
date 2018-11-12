module Fog
  module Compute
    class Gridscale
      class Real

        def server_relation_storage_update(server_uuid, storage_uuid, options)

          encoded_body = Fog::JSON.encode(options)
          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/servers/#{server_uuid}/storages/#{storage_uuid}",
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
