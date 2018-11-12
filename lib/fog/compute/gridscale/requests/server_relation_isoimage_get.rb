module Fog
  module Compute
    class Gridscale
      class Real

        def server_relation_isoimage_get(payload)
          server_uuid = payload[:server_uuid]
          isoimage_uuid = payload[:isoimage_uuid]
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/isoimages/#{isoimage_uuid}"
          )
        end

      end
    end
  end
end
