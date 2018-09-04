module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real

        def access_key_create()
          # update_options = {
          #     :name       => name,
          # }

          # encoded_body = Fog::JSON.encode()

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/objectstorages/access_keys",
              # :body    => encoded_body,
              )
        end
      end
    end
  end
end
