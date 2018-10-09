module Fog
  module Compute
    class Gridscale
      class Real
        def template_create(name, snapshot_uuid, options={})

          create_options = {
              :name   => name,
              :snapshot_uuid => snapshot_uuid,
          }

          create_options[:labels] = options[:labels] || []

          encoded_body = Fog::JSON.encode(create_options)

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