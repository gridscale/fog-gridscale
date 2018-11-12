require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Storages < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Storage

        def all(filters={})
          data = service.storages_get(filters)
          droplets = data.body["storages"].values
          load(droplets)
        end

        def get(object_uuid)
          storage = service.storage_get(object_uuid).body['storage']
          new(storage) if storage
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
