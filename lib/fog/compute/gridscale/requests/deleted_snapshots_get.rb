module Fog
  module Compute
    class Gridscale
      class Real

        def deleted_snapshots_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/snapshots",
              :query   => filters
          )
        end

      end
    end
  end
end
