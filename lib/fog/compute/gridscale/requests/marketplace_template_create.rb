module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def marketplace_template_create(payload)

          # create_options = {
          #     :family   => family,
          #     :location_uuid => "45ed677b-3702-4b36-be2a-a2eab9827950",
          #     # :cores   => cores,
          #     # :memory   => memory
          # }

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/marketplace/templates',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
