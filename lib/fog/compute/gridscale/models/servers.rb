require 'fog/core/collection'
require 'fog/compute/gridscale/models/server'
require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Servers < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Server

        def all(filters={})
          data = service.servers_get(filters)
          droplets = data.body["servers"].values
          load(droplets)
        end

        def get(object_uuid)
          server = service.server_get(object_uuid).body['server']
          new(server) if server
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
