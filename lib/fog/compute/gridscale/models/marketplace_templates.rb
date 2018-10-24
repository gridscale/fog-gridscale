require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class MarketplaceTemplates < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::MarketplaceTemplate


        def all(filters={})
          data = service.marketplace_templates_get(filters)
          droplets = data.body["marketplace_templates"].values
          load(droplets)
        end


        def get(object_uuid)
          marketplace_template = service.marketplace_template_get(object_uuid).body['marketplace_template']
          new(marketplace_template) if marketplace_template
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
