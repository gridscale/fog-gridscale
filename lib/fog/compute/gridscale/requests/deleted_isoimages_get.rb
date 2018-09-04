module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_isoimages_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/isoimages"
          )
        end
      end
    end
  end
end
