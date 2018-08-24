module Fog
  module Compute
    class Gridscale
      class Real
        def get_storages()
          # response        = Excon::Response.new
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/storages"
          )
          # return response.body
        end
      end
    end
  end
end
