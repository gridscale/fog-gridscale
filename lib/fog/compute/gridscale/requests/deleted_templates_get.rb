module Fog
  module Compute
    class Gridscale
      class Real

        def deleted_templates_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/deleted/templates",
              :query   => filters
          )
        end

      end
    end
  end
end
