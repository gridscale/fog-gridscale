module Fog
  module Compute
    class Gridscale
      class Real
        def access_key_get(access_key)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/objectstorages/access_keys/#{access_key}"
          )
        end
      end
    end
  end
end
