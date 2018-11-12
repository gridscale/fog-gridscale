module Fog
  module Compute
    class Gridscale
      class Real

        def network_delete(network_uuid)

          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/networks/#{network_uuid}",
              )
        end

      end
    end
  end
end
