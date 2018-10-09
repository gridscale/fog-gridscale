require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Requests < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Request


        def get(object_uuid)
          request = service.request_get(object_uuid).body[object_uuid]
          new(request) if request
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
