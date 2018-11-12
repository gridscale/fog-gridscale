module Fog
  module Compute
    class Gridscale
      class Real
        def load_balancer_create(name, algorithm, listen_ipv4_uuid, listen_ipv6_uuid, backend_servers, forwarding_rules, redirect_http_to_https, labels, options={})
          create_options = {
              :name   => name,
              :algorithm => algorithm,
              :listen_ipv4_uuid => listen_ipv4_uuid,
              :listen_ipv6_uuid => listen_ipv6_uuid,
              :backend_servers => backend_servers,
              :forwarding_rules => forwarding_rules,
              :redirect_http_to_https=>redirect_http_to_https,
              :labels => labels

          }

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
              :path    => '/objects/loadbalancers',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
