require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Locations < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Location


        def all(filters={})
          data = service.locations_get(filters)
          droplets = data.body["locations"].values
          load(droplets)
        end

        def get(object_uuid)
          location = service.location_get(object_uuid).body
          new(location) if location
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
