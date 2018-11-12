require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class PaasServices < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::PaasService

        def all(filters={})
          data = service.paas_services_get(filters)
          droplets = data.body["paas_services"].values
          load(droplets)
        end

        def get(object_uuid)
          paas_service = service.paas_service_get(object_uuid).body['paas_service']
          new(paas_service) if paas_service
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
