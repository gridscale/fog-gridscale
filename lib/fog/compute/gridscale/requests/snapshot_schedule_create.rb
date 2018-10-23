module Fog
  module Compute
    class Gridscale
      class Real

        def snapshot_schedule_create(storage_uuid, name, run_interval, keep_snapshots, options = {})
          create_options = {
              :name => name,
              :run_interval => run_interval,
              :keep_snapshots => keep_snapshots
          }
          create_options[:labels] = options[:labels] || []

          encoded_body = Fog::JSON.encode(create_options)

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
    end
  end
end
