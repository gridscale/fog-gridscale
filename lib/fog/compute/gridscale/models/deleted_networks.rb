require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class DeletedNetworks < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::DeletedNetwork


        def all(filters={})
          data = service.deleted_networks_get(filters)
          deleted_networks = data.body["deleted_networks"].values
          load(deleted_networks)
        end

      end
    end
  end
end
