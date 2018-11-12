module Fog
  module Compute
    class Gridscale
      class Real
        def isoimages_get(filters = {})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/isoimages",
              :query   => filters
          )
        end
      end
    end
  end
end
