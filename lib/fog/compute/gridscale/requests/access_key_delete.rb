module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def access_key_delete(access_key)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "objects/objectstorages/access_keys/#{access_key}",
              )
        end
      end

      # noinspection RubyStringKeysInHashInspection

    end
  end
end
