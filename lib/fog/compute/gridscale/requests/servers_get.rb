module Fog
  module Compute
    class Gridscale
      class Real

        def servers_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers",
              :query   => filters
          )
        end

      end
    end
  end
end
