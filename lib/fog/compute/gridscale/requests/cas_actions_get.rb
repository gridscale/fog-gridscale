module Fog
  module Compute
    class Gridscale
      class Real
        def cas_actions_get()
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/cas/actions"
          )
        end
      end
    end
  end
end
