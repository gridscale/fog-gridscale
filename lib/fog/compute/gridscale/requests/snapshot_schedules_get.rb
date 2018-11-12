module Fog
  module Compute
    class Gridscale
      class Real

        def snapshot_schedules_get(storage_uuid)
          storage_uuid = storage_uuid[:storage_uuid]

          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages/#{storage_uuid}/snapshot_schedules/"
          )
        end

      end
    end
  end
end
