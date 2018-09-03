module Fog
  module Compute
    class Gridscale
      class Real
        def template_add(payload)



          encoded_body = Fog::JSON.encode(payload)
          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/templates",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end