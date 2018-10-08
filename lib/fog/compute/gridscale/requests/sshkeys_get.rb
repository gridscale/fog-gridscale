module Fog
  module Compute
    class Gridscale
      class Real
        def sshkeys_get(filters={})
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/sshkeys",
              :query  => filters

          )
        end
      end
    end
  end
end
