module Fog
  module Compute
    class Gridscale
      class Real

        def request_get(object_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/requests/#{object_uuid}"
          )
        end

      end
    end
  end
end
