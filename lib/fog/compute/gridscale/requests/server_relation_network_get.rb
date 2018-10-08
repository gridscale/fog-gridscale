module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_network_get(payload)

          server_uuid = payload[:server_uuid]
          network_uuid = payload[:network_uuid]

          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/networks/#{network_uuid}"
          )
        end
      end
    end
  end
end

