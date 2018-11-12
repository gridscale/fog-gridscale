module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_servers_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/servers",
              :query   => filters
          )
        end
      end
    end
  end
end
