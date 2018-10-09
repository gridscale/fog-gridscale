require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Templates < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Template


        def all(filters={})
          data = service.templates_get(filters)
          droplets = data.body["templates"].values
          load(droplets)
        end

        def get(object_uuid)
          template = service.template_get(object_uuid).body['template']
          new(template) if template
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
