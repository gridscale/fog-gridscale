module Fog
  module Compute
    class Gridscale
      class Real

        def isoimage_events_get(isoimage_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/isoimages/#{isoimage_uuid}/events"
          )
        end

      end
    end
  end
end
