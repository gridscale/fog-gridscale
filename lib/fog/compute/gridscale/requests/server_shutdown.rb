module Fog
  module Compute
    class Gridscale
      class Real
        def server_shutdown(server_uuid)
          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/servers/#{server_uuid}/shutdown",
              )
        end
      end
    end
  end
end
