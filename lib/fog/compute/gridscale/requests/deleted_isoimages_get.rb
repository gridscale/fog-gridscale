module Fog
  module Compute
    class Gridscale
      class Real

        def deleted_isoimages_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/isoimages",
              :query   => filters
          )
        end

      end
    end
  end
end
