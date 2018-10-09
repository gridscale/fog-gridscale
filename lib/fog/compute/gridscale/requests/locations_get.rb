module Fog
  module Compute
    class Gridscale
      class Real
        def locations_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/locations",
              :query   => filters
          )
        end
      end
    end
  end
end
