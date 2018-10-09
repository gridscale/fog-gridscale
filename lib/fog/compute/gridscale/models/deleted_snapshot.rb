require 'fog/compute/gridscale/models/snapshot'

module Fog
  module Compute
    class Gridscale
      class DeletedSnapshot < Fog::Model
        identity :object_uuid

        attribute :capacity
        attribute :change_time
        attribute :create_time
        attribute :current_price
        attribute :labels
        attribute :last_used_template
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_uuid
        attribute :object_uuid
        attribute :parent_name
        attribute :parent_uuid
        attribute :storage_uuid
        attribute :reverse_dns
        attribute :status
        attribute :usage_in_minutes
        attribute :name


      end
    end
  end
end
