module Fog
  module Compute
    class Gridscale
      class Real
        def templates_get(filters={})
          # response        = Excon::Response.new
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/templates",
              :query   => filters

          )
          # return response.body
        end
      end
    end
  end
end
