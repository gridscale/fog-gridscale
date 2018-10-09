module Fog
  module Compute
    class Gridscale
      class Real
        def ip_delete(ip_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/ips/#{ip_uuid}",
              )
        end
      end
    end
  end
end
