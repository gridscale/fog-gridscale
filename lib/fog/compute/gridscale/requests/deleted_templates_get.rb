module Fog
  module Compute
    class Gridscale
      class Real
        def deleted_templates_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/templates"
          )
        end
      end
    end
  end
end
