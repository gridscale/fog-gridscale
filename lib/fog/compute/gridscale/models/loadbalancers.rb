require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Loadbalancers < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Loadbalancer

        def all(filters={})
          data = service.load_balancers_get(filters)
          loadbalancers = data.body["loadbalancers"].values
          load(loadbalancers)
        end


        def get(object_uuid)
          loadbalancer = service.load_balancer_get(object_uuid).body['loadbalancer']
          new(loadbalancer) if loadbalancer
        rescue Fog::Errors::NotFound
          nil
        end

      end
    end
  end
end
