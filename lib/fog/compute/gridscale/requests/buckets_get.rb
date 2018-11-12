module Fog
  module Compute
    class Gridscale
      class Real

        def buckets_get(filter={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/objectstorages/buckets",
              :query   => filter
          )
        end

      end
    end
  end
end