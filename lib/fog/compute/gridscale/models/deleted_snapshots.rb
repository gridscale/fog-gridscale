require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class DeletedSnapshots < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::DeletedSnapshots



        def all(filters={})
          data = service.deleted_snapshots_get(filters)
          deleted_snapshots = data.body["deleted_snapshots"].values
          load(deleted_snapshots)
        end



      end
    end
  end
end
