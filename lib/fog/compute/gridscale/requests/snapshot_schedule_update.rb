module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real

        def snapshot_schedule_update(storage_uuid, snapshot_schedule_uuid, payload={})

          encoded_body = Fog::JSON.encode(payload)


          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/storages/#{storage_uuid}/snapshot_schedules/#{snapshot_schedule_uuid}",
              :body    => encoded_body,
              )
        end
      end
      # noinspection RubyStringKeysInHashInspection
    end
  end
end
