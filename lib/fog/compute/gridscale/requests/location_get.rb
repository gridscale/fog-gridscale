module Fog
  module Compute
    class Gridscale
      class Real

        def location_get(location_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/locations/#{location_uuid}"
          )
        end

      end
    end
  end
end
