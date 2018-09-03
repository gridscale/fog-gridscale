module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real

        def template_update(template_uuid, payload={})
          # update_options = {
          #     # :name       => name,
          # }
          #
          #
          # [:name, :capacity].each do |opt|
          #   update_options[opt] = !!options[opt] if options[opt]
          # end

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
