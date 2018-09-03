module Fog
  module Compute
    class Gridscale
      class Real
        def template_get(template_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/templates/#{template_uuid}"
          )
        end
      end
    end
  end
end
