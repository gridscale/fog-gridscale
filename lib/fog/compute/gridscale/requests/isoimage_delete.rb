module Fog
  module Compute
    class Gridscale
      class Real

        def isoimage_delete(isoimage_uuid)
          request(
              :expects         => [204],
              :headers         => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method          => 'DELETE',
              :path            => "/objects/isoimages/#{isoimage_uuid}",
              )
        end

      end
    end
  end
end
