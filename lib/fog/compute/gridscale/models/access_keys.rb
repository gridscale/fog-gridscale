require 'fog/core/collection'
require 'fog/compute/gridscale/models/cas'
require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class AccessKeys < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::AccessKey

        def all(filters={})
          data = service.access_keys_get(filters)
          droplets = data.body["access_keys"]
          load(droplets)
        end

        def get(access_key)
          access_key = service.access_key_get(access_key).body['access_key']
          new(access_key) if access_key
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
