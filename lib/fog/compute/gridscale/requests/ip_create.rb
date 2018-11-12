module Fog
  module Compute
    class Gridscale
      class Real
        def ip_create(family, options ={})

          create_options = {
              :family   => family,
          }
          create_options[:labels] = options[:labels] || []

          if options[:name]
            create_options[:name] = options[:name]
          end

          if options[:failover]
            create_options[:failover] = options[:failover]
          end

          if options[:reverse_dns]
            create_options[:reverse_dns] = options[:reverse_dns]
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
              :path    => '/objects/ips',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
