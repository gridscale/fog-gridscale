module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_storages_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/storages"
          )
        end
      end
    end
  end
end
