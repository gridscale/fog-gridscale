module Fog
  module Compute
    class Gridscale
      class Real

        def access_key_create()
          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => "/objects/objectstorages/access_keys",
              )
        end
      end
    end
  end
end
