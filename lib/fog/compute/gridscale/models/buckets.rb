require 'fog/core/collection'
require 'fog/compute/gridscale/models/cas'
require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Buckets < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Bucket

        def all(filters={})
          data = service.buckets_get(filters)
          droplets = data.body["buckets"]
          load(droplets)
        end

        def get(name)
          bucket = service.bucket_get(name).body
          new(bucket) if bucket
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
