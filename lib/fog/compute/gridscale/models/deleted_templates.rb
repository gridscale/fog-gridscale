require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class DeletedeTemplates < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::DeletedTemplate


        def all(filters={})
          data = service.deleted_templates_get(filters)
          deleted_templates = data.body["deleted_templates"].values
          load(deleted_templates)
        end

      end
    end
  end
end
