module Fog
  module Compute
    class Gridscale
      class Real
        def marketplace_template_get(marketplace_template_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/marketplace/templates/#{marketplace_template_uuid}"
          )
        end
      end
    end
  end
end
