module Fog
  module Compute
    class Gridscale
      class Real
        def firewall_create(name, rules)

          create_payload ={
              :name => name,
              :rules => rules
          }

          encoded_body = Fog::JSON.encode(create_payload)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/firewalls',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
