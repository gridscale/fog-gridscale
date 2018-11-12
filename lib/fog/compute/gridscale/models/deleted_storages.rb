require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class DeletedStorages < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::DeletedStorage

        def all(filters={})
          data = service.deleted_storages_get(filters)
          deleted_storages = data.body["deleted_storages"].values
          load(deleted_storages)
        end

      end
    end
  end
end
