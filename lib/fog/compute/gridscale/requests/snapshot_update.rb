module Fog
  module Compute
    class Gridscale
      class Real

        def snapshot_update(storage_uuid, snapshot_uuid, payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/storages/#{storage_uuid}/snapshots/#{snapshot_uuid}",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
