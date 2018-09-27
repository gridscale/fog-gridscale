require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Storage < Fog::Model
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



        def delete
          requires :object_uuid
          response = service.storage_delete object_uuid
          response.body
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :capacity

          options = {}
          options[:labels] = labels


          data = service.storage_create(name, capacity, options)

          merge_attributes(data.body)
          true
        end

        def update
          requires :object_uuid
          data = service.storage_update(object_uuid)
          merge_attributes(data.body)
          true
        end
      end
    end
  end
end
