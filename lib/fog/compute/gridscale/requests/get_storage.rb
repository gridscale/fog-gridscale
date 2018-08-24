module Fog
  module Compute
    class Gridscale
      class Real
        def get_storage(storage_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages/#{storage_uuid}"
          )
        end
      end
    end
  end
end
