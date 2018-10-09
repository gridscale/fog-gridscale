require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class DeletedIps < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::DeletedIp

        def all(filters={})
          data = service.deleted_ips_get(filters)
          ips = data.body['deleted_ips'].values
          load(ips)
        end

      end
    end
  end
end
