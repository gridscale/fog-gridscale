module Fog
  module Compute
    class Gridscale
      class Real
        def get_server(server_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}"
          )
        end
      end
    end
  end
end
