module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def server_relation_network_delete(object_uuid)
          # pp server_uuid
          # pp object_uuid

          server_uuid = object_uuid[:server_uuid]
          network_uuid = object_uuid[:network_uuid]

          request(
              :expects         => [202],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/servers/#{server_uuid}/networks/#{network_uuid}",
              )
        end
      end

      # noinspection RubyStringKeysInHashInspection

    end
  end
end
