module Fog
  module Compute
    class Gridscale
      class Real
        def get_servers()
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
