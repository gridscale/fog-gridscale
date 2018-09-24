require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Storages < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Storage

        # Returns list of ssh keys
        # @return [Fog::Compute::DigitalOceanV2::Sshkeys] Retrieves a list of ssh keys.
        # @raise [Fog::Compute::DigitalOceanV2::NotFound] - HTTP 404
        # @raise [Fog::Compute::DigitalOceanV2::BadRequest] - HTTP 400
        # @raise [Fog::Compute::DigitalOceanV2::InternalServerError] - HTTP 500
        # @raise [Fog::Compute::DigitalOceanV2::ServiceError]
        # @see https://developers.digitalocean.com/documentation/v2/#list-all-keys
        def all(filters={})
          data = service.storages_get(filters)
          droplets = data.body["storages"].values
          load(droplets)
        end

        # Retrieves server
        # @param [String] id for server to be returned
        # @return [Fog::Compute::DigitalOceanV2:Server]
        # @raise [Fog::Compute::DigitalOceanV2::NotFound] - HTTP 404
        # @raise [Fog::Compute::DigitalOceanV2::BadRequest] - HTTP 400
        # @raise [Fog::Compute::DigitalOceanV2::InternalServerError] - HTTP 500
        # @raise [Fog::Compute::DigitalOceanV2::ServiceError]
        # @see https://developers.digitalocean.com/documentation/v2/#retrieve-an-existing-droplet-by-id
        def get(object_uuid)
          storage = service.storage_get(object_uuid).body['storage']
          new(storage) if storage
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
