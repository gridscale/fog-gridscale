require 'fog/core/collection'
require 'fog/compute/gridscale/models/cas'
require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Cass < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Cas

        def all(filters={})
          data = service.cass_get(filters)
          droplets = data.body["tasks"].values
          load(droplets)
        end

        def get(object_uuid)
          data = service.cas_get(object_uuid).body['task']
          new(data) if data
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
