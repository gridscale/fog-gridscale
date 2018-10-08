require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Snapshots < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Snapshot



        def all(filters={})
          data = service.snapshots_get(filters)
          snapshots = data.body["snapshots"].values
          load(snapshots)
        end


        def get(payload)
          snapshot = service.snapshot_get(payload).body['snapshot']
          new(snapshot) if snapshot
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
