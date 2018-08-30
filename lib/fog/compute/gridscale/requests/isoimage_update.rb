module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real

        def isoimage_update(isoimage_uuid, payload)
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
              :path    => "/objects/isoimages/#{isoimage_uuid}",
              :body    => encoded_body,
              )
        end
      end
      # noinspection RubyStringKeysInHashInspection
    end
  end
end
