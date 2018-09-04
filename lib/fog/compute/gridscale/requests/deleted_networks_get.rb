module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_networks_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/networks"
          )
        end
      end
    end
  end
end
