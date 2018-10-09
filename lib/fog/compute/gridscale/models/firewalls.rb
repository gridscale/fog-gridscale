require 'fog/core/collection'
require 'fog/compute/gridscale/models/firewall'
require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Firewalls < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Firewall

        def all(filters={})
          data = service.firewalls_get(filters)
          droplets = data.body["firewalls"].values
          load(droplets)
        end

        def get(object_uuid)
          data = service.firewall_get(object_uuid).body['firewall']
          new(data) if data
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
