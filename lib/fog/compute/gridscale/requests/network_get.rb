module Fog
  module Compute
    class Gridscale
      class Real

        def network_get(network_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/networks/#{network_uuid}"
          )
        end

      end
    end
  end
end
