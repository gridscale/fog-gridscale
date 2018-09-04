module Fog
  module Compute
    class Gridscale
      class Real
        def buckets_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/objectstorages/buckets"
          )
        end
      end
    end
  end
end