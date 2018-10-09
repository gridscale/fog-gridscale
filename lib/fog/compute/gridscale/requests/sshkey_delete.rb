module Fog
  module Compute
    class Gridscale
      class Real
        def sshkey_delete(sshkey_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/sshkeys/#{sshkey_uuid}",
              )
        end
      end
    end
  end
end
