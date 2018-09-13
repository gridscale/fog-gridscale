require 'fog/core/collection'
require 'fog/compute/gridscale/models/server'
require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Servers < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Server

        # Returns list of servers
        # @return [Fog::Compute::DigitalOceanV2::Servers]
        # @raise [Fog::Compute::DigitalOceanV2::NotFound] - HTTP 404
        # @raise [Fog::Compute::DigitalOceanV2::BadRequest] - HTTP 400
        # @raise [Fog::Compute::DigitalOceanV2::InternalServerError] - HTTP 500
        # @raise [Fog::Compute::DigitalOceanV2::ServiceError]
        # @see https://developers.digitalocean.com/documentation/v2/#droplets
        # def all()
        #   data = service.servers_get()['servers'].values
        #   return data
        #
        # end

        def all(filters={})
          data = service.servers_get(filters)
          droplets = data.body["servers"].values
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
          server = service.server_get(object_uuid).body['server']
          new(server) if server
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
