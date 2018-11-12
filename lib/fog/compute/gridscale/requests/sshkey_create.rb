module Fog
  module Compute
    class Gridscale
      class Real

        def sshkey_create(name, sshkey, options = {})

          create_options = {
              :name   => name,
              :sshkey => sshkey,
          }
          # create_options[:labels] = options[:labels] || []
          if options[:labels]
            create_options[:labels] = options[:labels]
          end

          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/sshkeys',
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
