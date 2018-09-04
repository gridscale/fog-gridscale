module Fog
  module Compute
    class Gridscale
      class Real
        def marketplace_templates_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/marketplace/templates"
          )
        end
      end
    end
  end
end
