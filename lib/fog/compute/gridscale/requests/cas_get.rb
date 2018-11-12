module Fog
  module Compute
    class Gridscale
      class Real

        def cas_get(cas_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/cas/tasks/#{cas_uuid}"
          )
        end

      end
    end
  end
end
