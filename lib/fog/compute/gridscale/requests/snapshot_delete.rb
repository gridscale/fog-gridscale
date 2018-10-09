module Fog
  module Compute
    class Gridscale
      class Real
        def snapshot_delete(object_uuid)

          storage_uuid = object_uuid[:storage_uuid]
          snapshot_uuid = object_uuid[:snapshot_uuid]

          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "objects/storages/#{storage_uuid}/snapshots/#{snapshot_uuid}",
              )
        end
      end
    end
  end
end
