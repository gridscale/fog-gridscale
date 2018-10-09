module Fog
  module Compute
    class Gridscale
      class Real
        def marketplace_template_delete(marketplace_template_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/marketplace/templates/#{marketplace_template_uuid}",
              )
        end
      end
    end
  end
end
