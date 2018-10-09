module Fog
  module Compute
    class Gridscale
      class Real
        def sshkey_create(name, sshkey)

          create_options = {
              :name   => name,
              :sshkey => sshkey,
          }

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
