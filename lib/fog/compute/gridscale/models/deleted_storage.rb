require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class DeletedStorage < Fog::Model
        identity :object_uuid

        attribute :name
        attribute :object_uuid
        attribute :location_uuid
        attribute :storage_type
        attribute :license_product_no
        attribute :capacity
        attribute :labels
        attribute :status
        attribute :create_time
        attribute :change_time
        attribute :current_price
        attribute :location_uuid
        attribute :location_name
        attribute :location_country
        attribute :location_iata
        attribute :relations


      end
    end
  end
end
