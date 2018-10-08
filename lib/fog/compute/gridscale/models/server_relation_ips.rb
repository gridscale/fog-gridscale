require 'fog/compute/gridscale/models/paging_collection'
require 'fog/compute/gridscale/models/server_relation_network'

module Fog
  module Compute
    class Gridscale
      class ServerRelationIps < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::ServerRelationIp



        def all(server_uuid)
          # requires :server_uuid
          data = service.server_relation_ips_get(server_uuid)
          relations = data.body['ip_relations']
          load(relations)
        end


        def get(payload)
          ips_relation = service.server_relation_ip_get(payload).body['ip_relation']
          new(ips_relation) if ips_relation
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
