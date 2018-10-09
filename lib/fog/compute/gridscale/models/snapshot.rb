require 'fog/compute/gridscale/models/snapshot'

module Fog
  module Compute
    class Gridscale
      class Snapshot < Fog::Model
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



        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :storage_uuid , :name


          data = service.snapshot_create(storage_uuid, name)

          merge_attributes(data.body)
          true
        end

        def delete
          requires :object_uuid
          response = service.ip_delete storage_uuid
          response.body
        end

        def destroy

          response = service.snapshot_delete(object_uuid)
          response.body

        end

        private


      end
    end
  end
end
