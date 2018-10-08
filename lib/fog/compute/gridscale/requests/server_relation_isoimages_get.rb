module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_isoimages_get(server_uuid)
          server_uuid = server_uuid[:server_uuid]

          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/isoimages"
          )
        end
      end
    end
  end
end
