require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Interfaces < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::ServerRelationNetwork

        def all(server_uuid)
          # requires :server_uuid
          data = service.server_relation_networks_get(server_uuid)
          relations = data.body['network_relations'].each
          load(relations)
        end

        def get(server_uuid, network_uuid)
          networks_relation = service.server_relation_network_get(server_uuid, network_uuid).body['network_relation']
          new(networks_relation) if networks_relation
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
