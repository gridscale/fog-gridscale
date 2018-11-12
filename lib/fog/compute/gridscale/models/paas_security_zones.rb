require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class PaasSecurityZones < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::PaasSecurityZone

        def all(filters={})
          data = service.paas_security_zones_get(filters)
          droplets = data.body["paas_security_zones"].values
          load(droplets)
        end


        def get(object_uuid)
          paas_security_zone = service.paas_security_zone_get(object_uuid).body['paas_security_zone']
          new(paas_security_zone) if paas_security_zone
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
