module Fog
  module Compute
    class Gridscale
      class Real

        def firewall_create(name, rules, options ={})

          create_options ={
              :name => name,
              :rules => rules
          }

          create_options[:labels] = options[:labels] || []

          encoded_body = Fog::JSON.encode(create_options)

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
