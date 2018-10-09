module Fog
  module Compute
    class Gridscale
      class Real
        def templates_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/templates",
              :query   => filters

          )
        end
      end
    end
  end
end
