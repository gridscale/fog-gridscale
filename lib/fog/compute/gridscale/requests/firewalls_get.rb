module Fog
  module Compute
    class Gridscale
      class Real
        def firewalls_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/firewalls"
          )
        end
      end
    end
  end
end
