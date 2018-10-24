module Fog
  module Compute
    class Gridscale
      class Real
        def marketplace_template_create(options={})
          create_options = {
          }

          create_options[:labels] = options[:labels] || []

          if options[:name]
            create_options[:name] = options[:name]
          end

          if options[:capacity]
            create_options[:capacity] = options[:capacity]
          end

          if options[:object_storage_path]
            create_options[:object_storage_path] = options[:object_storage_path]
          end

          if options[:object_storage_path]
            create_options[:object_storage_path] = options[:object_storage_path]
          end

          if options[:unique_hash]
            create_options[:unique_hash] = options[:unique_hash]
          end
          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/marketplace/templates',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
