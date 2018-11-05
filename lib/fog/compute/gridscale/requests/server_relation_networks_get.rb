module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_networks_get(server_uuid, filters={})
          # server_uuid = server_uuid[:server_uuid]

          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/networks",
              :query => filters
          )

        end
      end
    end
  end
end

