module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_networks_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/networks",
              :query => filters
          )
        end
      end
    end
  end
end
