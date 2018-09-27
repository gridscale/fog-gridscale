module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real

        def snapshot_schedule_add(storage_uuid, payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/storages/#{storage_uuid}/snapshot_schedules",
              :body    => encoded_body,
              )
        end
      end
      # noinspection RubyStringKeysInHashInspection
    end
  end
end
