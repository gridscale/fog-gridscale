module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_storages_get(server_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/storages"
          )
        end
      end
    end
  end
end

