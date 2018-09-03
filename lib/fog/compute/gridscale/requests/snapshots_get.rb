module Fog
  module Compute
    class Gridscale
      class Real
        def snapshots_get(storage_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages/#{storage_uuid}/snapshots/"
          )
        end
      end
    end
  end
end
