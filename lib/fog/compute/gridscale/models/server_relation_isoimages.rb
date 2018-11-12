require 'fog/compute/gridscale/models/paging_collection'
require 'fog/compute/gridscale/models/server_relation_isoimage'

module Fog
  module Compute
    class Gridscale
      class ServerRelationIsoimages < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::ServerRelationIsoimage

        def all(server_uuid)
          # requires :server_uuid
          data = service.server_relation_isoimages_get(server_uuid)
          relations = data.body['isoimage_relations']
          load(relations)
        end

        def get(payload)
          isoimages_relation = service.server_relation_isoimage_get(payload).body['isoimage_relation']
          new(isoimages_relation) if isoimages_relation
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
