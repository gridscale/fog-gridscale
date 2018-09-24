require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Interfaces < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Interface

        # Returns list of ssh keys
        # @return [Fog::Compute::DigitalOceanV2::Sshkeys] Retrieves a list of ssh keys.
        # @raise [Fog::Compute::DigitalOceanV2::NotFound] - HTTP 404
        # @raise [Fog::Compute::DigitalOceanV2::BadRequest] - HTTP 400
        # @raise [Fog::Compute::DigitalOceanV2::InternalServerError] - HTTP 500
        # @raise [Fog::Compute::DigitalOceanV2::ServiceError]
        # @see https://developers.digitalocean.com/documentation/v2/#list-all-keys
        def all(filters={})
          data = service.networks_get(filters)
          droplets = data.body["networks"].values
          load(droplets)
        end

        # Returns ssh key
        # @return [Fog::Compute::DigitalOceanV2::Sshkeys] Retrieves a list of ssh keys.
        # @raise [Fog::Compute::DigitalOceanV2::NotFound] - HTTP 404
        # @raise [Fog::Compute::DigitalOceanV2::BadRequest] - HTTP 400
        # @raise [Fog::Compute::DigitalOceanV2::InternalServerError] - HTTP 500
        # @raise [Fog::Compute::DigitalOceanV2::ServiceError]
        # @see https://developers.digitalocean.com/documentation/v2/#retrieve-an-existing-key
        def get(object_uuid)
          network = service.network_get(object_uuid).body['network']
          new(network) if network
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
