module Fog
  module Compute
    class Gridscale
      class Real
        def snapshot_get(storage_uuid, snapshot_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages/#{storage_uuid}/snapshots/#{snapshot_uuid}"
          )
        end
      end
    end
  end
end
