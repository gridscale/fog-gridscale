require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class DeletedTemplate < Fog::Model
        identity :object_uuid

        attribute :capacity
        attribute :change_time
        attribute :create_time
        attribute :current_price
        attribute :description
        attribute :distro
        attribute :labels
        attribute :license_product_no
        attribute :location_country
        attribute :location_name
        attribute :location_uuid
        attribute :name
        attribute :object_uuid
        attribute :ostype
        attribute :private
        attribute :status
        attribute :usage_in_minutes
        attribute :version
        attribute :snapshot_uuid


      end
    end
  end
end
