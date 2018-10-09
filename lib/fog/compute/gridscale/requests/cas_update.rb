module Fog
  module Compute
    class Gridscale
      class Real

        def cas_update(cas_uuid, payload)
          encoded_body = Fog::JSON.encode(payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'PATCH',
              :path    => "/objects/cas/tasks/#{cas_uuid}",
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
