module Fog
  module Compute
    class Gridscale
      class Real
        def networks_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/networks"
          )
        end
      end
    end
  end
end
