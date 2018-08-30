module Fog
  module Compute
    class Gridscale
      class Real
        def ips_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/ips"
          )
        end
      end
    end
  end
end
