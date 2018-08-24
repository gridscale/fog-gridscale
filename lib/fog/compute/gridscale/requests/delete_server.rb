module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def delete_server(server_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/servers/#{server_uuid}",
              )
        end
      end

      # noinspection RubyStringKeysInHashInspection

    end
  end
end
