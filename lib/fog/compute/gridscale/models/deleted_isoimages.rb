require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class DeletedIps < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::DeletedIp

        def all(filters={})
          data = service.deleted_isoimages_get(filters)
          deleted_isoimages = data.body['deleted_isoimages'].values
          load(deleted_isoimages)
        end

      end
    end
  end
end
