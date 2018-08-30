module Fog
  module Compute
    class Gridscale
      class Real
        def server_power_get(server_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}/power"
          )
        end
      end
    end
  end
end
