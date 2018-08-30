module Fog
  module Compute
    class Gridscale
      class Real
        def server_relation_storage_get(server_uuid, storage_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/storages/#{storage_uuid}"
          )
        end
      end
    end
  end
end

