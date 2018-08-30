module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def server_relation_storage_remove(server_uuid, storage_uuid)
          request(
              :expects         => [202],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/servers/#{server_uuid}/storages/#{storage_uuid}",
              )
        end
      end

      # noinspection RubyStringKeysInHashInspection

    end
  end
end
