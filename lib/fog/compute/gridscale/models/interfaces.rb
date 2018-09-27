require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Interfaces < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Interface


        def all(filters={})
          data = service.networks_get(filters)
          droplets = data.body["networks"].values
          load(droplets)
        end

        def get(object_uuid)
          network = service.network_get(object_uuid).body['network']
          new(network) if network
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
