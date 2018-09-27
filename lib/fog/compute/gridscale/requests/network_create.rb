module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def network_create(payload)


          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/networks',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
