module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_ips_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/ips"
          )
        end
      end
    end
  end
end
