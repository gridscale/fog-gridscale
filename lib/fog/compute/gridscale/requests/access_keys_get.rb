module Fog
  module Compute
    class Gridscale
      class Real
        def access_keys_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/objectstorages/access_keys"
          )
        end
      end
    end
  end
end
