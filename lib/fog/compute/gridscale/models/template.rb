require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Template < Fog::Model
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

        def delete
          requires :object_uuid
          response = service.template_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.template_delete object_uuid
          response.body
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :snapshot_uuid

          options = {}
          options[:labels] = labels

          data = service.template_create(name, snapshot_uuid, options)

          merge_attributes(data.body)
          true
        end

        def update
          requires :object_uuid

          payload = {}

          data = service.template_update(object_uuid, payload)
          merge_attributes(data.body)
          true
        end

      end
    end
  end
end
