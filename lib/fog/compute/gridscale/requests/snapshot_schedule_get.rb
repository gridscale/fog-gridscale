module Fog
  module Compute
    class Gridscale
      class Real
        def snapshot_schedule_get(payload)
          storage_uuid = payload[:storage_uuid]
          snapshot_schedule_uuid = payload[:snapshot_schedule_uuid]
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages/#{storage_uuid}/snapshot_schedules/#{snapshot_schedule_uuid}"
          )
        end
      end
    end
  end
end
