module Fog
  module Compute
    class Gridscale
      class Real
        def storage_create(name, capacity, options = {})
          create_options = {
              :name   => name,
              :capacity   => capacity,
          }

          create_options[:labels] = options[:labels] || []

          if options[:storage_type]
            create_options[:storage_type] = options[:storage_type]
          end

          if options[:template]
            create_options[:template] = options[:template]
          end

          if options[:location_uuid]
            create_options[:location_uuid] = options[:location_uuid]
          else
            create_options[:location_uuid] = '45ed677b-3702-4b36-be2a-a2eab9827950'
          end

          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/storages',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
