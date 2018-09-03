module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def template_delete(template_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/templates/#{template_uuid}",
              )
        end
      end

      # noinspection RubyStringKeysInHashInspection

    end
  end
end
