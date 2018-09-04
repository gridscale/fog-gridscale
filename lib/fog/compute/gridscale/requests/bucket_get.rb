module Fog
  module Compute
    class Gridscale
      class Real
        def bucket_get(bucket_name)
          request(
              :expects => [200],
              :method  => 'GET',
              :path    => "objects/objectstorages/buckets/#{bucket_name}"
          )
        end
      end
    end
  end
end

