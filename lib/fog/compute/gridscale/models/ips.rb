require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Ips < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Ip

        def all(filters={})
          data = service.ips_get(filters)
          ips = data.body["ips"].values
          load(ips)
        end


        def get(object_uuid)
          ip = service.ip_get(object_uuid).body['ip']
          new(ip) if ip
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
