module Fog
  module Compute
    class Gridscale
      class Real
        def templates_get()
          # response        = Excon::Response.new
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/templates"
          )
          # return response.body
        end
      end
    end
  end
end
