module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_servers_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/servers"
          )
        end
      end
    end
  end
end
