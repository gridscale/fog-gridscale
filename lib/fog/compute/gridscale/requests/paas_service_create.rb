module Fog
  module Compute
    class Gridscale
      class Real

        def paas_service_create(name, paas_service_template_uuid, options = {})
          create_options = {
              :name   => name,
              :paas_service_template_uuid => paas_service_template_uuid,
          }

          create_options[:labels] = options[:labels] || []

          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/paas/services',
              :body    => encoded_body,
              )
        end

      end
    end
  end
end
