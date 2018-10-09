require 'fog/core/collection'
require 'fog/compute/gridscale/models/server'
require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class DeletedServers < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::DeletedServer

        def all(filters={})
          data = service.deleted_servers_get(filters)
          deleted_servers = data.body["deleted_servers"].values
          load(deleted_servers)
        end

      end
    end
  end
end
