module Fog
  module Compute
    class Gridscale
      class Real

        def deleted_ips_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/ips",
              :query   => filters
          )
        end

      end
    end
  end
end
