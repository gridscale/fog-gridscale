module Fog
  module Compute
    class Gridscale
      class Real
        def firewalls_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/firewalls",
              :query => filters
          )
        end
      end
    end
  end
end
