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
        def all()
          data = service.get_servers()
          links = data.body["links"]
          get_paged_links(links)
          droplets = data.body
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
        def get(id)
          server = service.get_server(id).body
          new(server) if server
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
