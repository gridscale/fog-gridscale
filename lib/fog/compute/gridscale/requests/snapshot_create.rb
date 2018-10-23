module Fog
  module Compute
    class Gridscale
      class Real

        def snapshot_create(storage_uuid, name, options ={})
          create_options = {
              :name => name
          }

          create_options[:labels] = options[:labels] || []

          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/storages/#{storage_uuid}/snapshots",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
