module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def server_relation_ip_delete(object_uuid)
          server_uuid = object_uuid[:server_uuid]
          ip_uuid = object_uuid[:ip_uuid]
          request(
              :expects         => [202],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/servers/#{server_uuid}/ips/#{ip_uuid}",
              )
        end
      end

      # noinspection RubyStringKeysInHashInspection

    end
  end
end
