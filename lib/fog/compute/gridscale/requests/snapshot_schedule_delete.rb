module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def snapshot_schedule_delete(object_uuid)

          storage_uuid = object_uuid[:storage_uuid]
          snapshot_schedule_uuid = object_uuid[:snapshot_schedule_uuid]

          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "objects/storages/#{storage_uuid}/snapshot_schedules/#{snapshot_schedule_uuid}",
              )
        end
      end

      # noinspection RubyStringKeysInHashInspection

    end
  end
end
