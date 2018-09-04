module Fog
  module Compute
    class Gridscale
      class Real
        def request_get(request_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/requests/#{request_uuid}"
          )
        end
      end
    end
  end
end
