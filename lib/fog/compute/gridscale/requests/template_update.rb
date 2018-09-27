module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real

        def template_update(template_uuid, payload={})


          encoded_body = Fog::JSON.encode(payload)


          request(
              :expects => [204],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/templates/#{template_uuid}",
              :body    => encoded_body,
              )
        end
      end
      # noinspection RubyStringKeysInHashInspection
    end
  end
end
