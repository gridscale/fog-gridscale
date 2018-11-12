require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Isoimage < Fog::Model
        identity :object_uuid

        attribute :capacity
        attribute :change_time
        attribute :create_time
        attribute :current_price
        attribute :description
        attribute :labels
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_uuid
        attribute :name
        attribute :object_uuid
        attribute :private
        attribute :relations
        attribute :source_url
        attribute :status
        attribute :usage_in_minutes
        attribute :version

        def delete
          requires :object_uuid
          response = service.isoimage_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.isoimage_delete object_uuid
          response.body
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :source_url

          options = {}
          options[:labels] = labels
          if attributes[:location_uuid]
            options[:location_uuid] = location_uuid
          end

          data = service.isoimage_create(name, source_url, options)

          merge_attributes(data.body)
          true
        end

        def update
          requires :object_uuid

          payload = {}

          data = service.isoimage_update(object_uuid, payload)
          merge_attributes(data.body)
          true
        end
      end
    end
  end
end
