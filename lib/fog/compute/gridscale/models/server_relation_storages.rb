require 'fog/compute/gridscale/models/paging_collection'
require 'fog/compute/gridscale/models/server_relation_storage'

module Fog
  module Compute
    class Gridscale
      class ServerRelationStorages < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::ServerRelationStorage

        def all(server_uuid)
          data = service.server_relation_storages_get(server_uuid)
          storages_relations = data.body['storage_relations']
          load(storages_relations)
        end


        def get(payload)
          storages_relation = service.server_relation_storage_get(payload).body['storage_relation']
          new(storages_relation) if storages_relation
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
