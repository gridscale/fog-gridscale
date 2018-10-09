require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Isoimages < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Isoimage


        def all(filters={})
          data = service.isoimages_get(filters)
          droplets = data.body["isoimages"].values
          load(droplets)
        end

        def get(object_uuid)
          isoimage = service.isoimage_get(object_uuid).body['isoimage']
          new(isoimage) if isoimage
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
