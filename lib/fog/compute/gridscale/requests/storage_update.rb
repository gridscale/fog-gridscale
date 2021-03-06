module Fog
  module Compute
    class Gridscale
      class Real

        def storage_update(storage_uuid, payload={})

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/storages/#{storage_uuid}",
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
