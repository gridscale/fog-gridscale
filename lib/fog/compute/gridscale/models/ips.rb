require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Ips < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Ip
        # Returns list of servers
        # @return [Fog::Compute::DigitalOceanV2::Servers]
        # @raise [Fog::Compute::DigitalOceanV2::NotFound] - HTTP 404
        # @raise [Fog::Compute::DigitalOceanV2::BadRequest] - HTTP 400
        # @raise [Fog::Compute::DigitalOceanV2::InternalServerError] - HTTP 500
        # @raise [Fog::Compute::DigitalOceanV2::ServiceError]
        # @see https://developers.digitalocean.com/documentation/v2/#droplets


        def all(filters={})
          data = service.ips_get(filters)
          ips = data.body["ips"].values
          load(ips)
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
          ip = service.ip_get(object_uuid).body['ip']
          new(ip) if ip
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
