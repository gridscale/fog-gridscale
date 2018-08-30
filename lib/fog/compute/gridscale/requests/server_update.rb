module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real

        def server_update(server_uuid, payload)
          # update_options = {
          #     :name       => name,
          # }

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/servers/#{server_uuid}",
              :body    => encoded_body,
              )
        end
      end
      # noinspection RubyStringKeysInHashInspection
    end
  end
end
