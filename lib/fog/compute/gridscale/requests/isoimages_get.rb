module Fog
  module Compute
    class Gridscale
      class Real
        def isoimages_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/isoimages"
          )
        end
      end
    end
  end
end
