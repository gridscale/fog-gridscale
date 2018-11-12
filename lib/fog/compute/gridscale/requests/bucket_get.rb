module Fog
  module Compute
    class Gridscale
      class Real

        def bucket_get(name)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/objectstorages/buckets/#{name}"
          )
        end

      end
    end
  end
end

