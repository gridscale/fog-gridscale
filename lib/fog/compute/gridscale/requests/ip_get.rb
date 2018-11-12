module Fog
  module Compute
    class Gridscale
      class Real

        def ip_get(ip_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/ips/#{ip_uuid}"
          )
        end

      end
    end
  end
end
