module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_snapshots_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/snapshots"
          )
        end
      end
    end
  end
end
