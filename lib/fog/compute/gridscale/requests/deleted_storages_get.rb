module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_storages_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/storages",
              :query => filters
          )
        end
      end
    end
  end
end
