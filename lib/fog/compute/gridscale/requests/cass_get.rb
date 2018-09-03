module Fog
  module Compute
    class Gridscale
      class Real
        def cass_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/cas/tasks"
          )
        end
      end
    end
  end
end
