module Fog
  module Compute
    class Gridscale
      class Real
        def access_keys_get(filters = {})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/objectstorages/access_keys",
              :query   => filters

          )
        end
      end
    end
  end
end
