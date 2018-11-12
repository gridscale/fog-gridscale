module Fog
  module Compute
    class Gridscale
      class Real

        def cass_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/cas/tasks",
              :query   => filters
          )
        end

      end
    end
  end
end
