module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def create_storage(name, capacity)

          create_options = {
              :name   => name,
              :location_uuid => "45ed677b-3702-4b36-be2a-a2eab9827950",
              :capacity   => capacity,
          }



          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/storages',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
