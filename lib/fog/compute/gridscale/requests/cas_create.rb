module Fog
  module Compute
    class Gridscale
      class Real

        def cas_create(payload)

          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/cas/tasks",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
