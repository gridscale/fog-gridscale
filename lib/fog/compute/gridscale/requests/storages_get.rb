module Fog
  module Compute
    class Gridscale
      class Real

        def storages_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages",
              :query   => filters
          )
        end

      end
    end
  end
end
