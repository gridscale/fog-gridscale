module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_ips_get(server_uuid)
          server_uuid = server_uuid[:server_uuid]

          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/ips"
          )
        end
      end
    end
  end
end
