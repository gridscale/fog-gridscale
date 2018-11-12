require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class DeletedIp < Fog::Model
        identity :object_uuid

        attribute :current_price
        attribute :delete_block
        attribute :failover
        attribute :family
        attribute :ip
        attribute :labels
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_uuid
        attribute :object_uuid
        attribute :partner_uuid
        attribute :prefix
        attribute :relations
        attribute :reverse_dns
        attribute :status
        attribute :usage_in_minutes

      end
    end
  end
end
