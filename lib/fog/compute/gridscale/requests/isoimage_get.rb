module Fog
  module Compute
    class Gridscale
      class Real

        def isoimage_get(isoimage_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/isoimages/#{isoimage_uuid}"
          )
        end

      end
    end
  end
end
