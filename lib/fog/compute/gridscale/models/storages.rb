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
        def all(filters = {})
          data = service.get_storages(filters)
          links = data.body["links"]
          get_paged_links(links)
          keys = data.body["ssh_keys"]
          load(keys)
        end

        # Returns ssh key
        # @return [Fog::Compute::DigitalOceanV2::Sshkeys] Retrieves a list of ssh keys.
        # @raise [Fog::Compute::DigitalOceanV2::NotFound] - HTTP 404
        # @raise [Fog::Compute::DigitalOceanV2::BadRequest] - HTTP 400
        # @raise [Fog::Compute::DigitalOceanV2::InternalServerError] - HTTP 500
        # @raise [Fog::Compute::DigitalOceanV2::ServiceError]
        # @see https://developers.digitalocean.com/documentation/v2/#retrieve-an-existing-key
        def get(id)
          key = service.get_storage(id).body['storage']
          new(key) if key
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
