module Fog
  module Compute
    class Gridscale
      class Real

        def sshkey_get(sshkey_uuid)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "/objects/sshkeys/#{sshkey_uuid}"
          )
        end

      end
    end
  end
end
