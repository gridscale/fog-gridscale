module Fog
  module Compute
    class Gridscale
      class Real
        def template_events_get(template_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/templates/#{template_uuid}/events"
          )
        end
      end
    end
  end
end
