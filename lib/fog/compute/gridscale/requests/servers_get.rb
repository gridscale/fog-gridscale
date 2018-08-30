module Fog
  module Compute
    class Gridscale
      class Real
        def servers_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers"
          )
        end
      end
    end
  end
end
