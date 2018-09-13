require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Storage < Fog::Model
        identity :object_uuid

        attribute :name,        :aliases => 'metadata_namespace'
        attribute :object_uuid
        attribute :location_uuid
        attribute :storage_type,         :aliases => 'status_node_info_os_image'
        attribute :license_product_no , :aliases => 'status_node_info_operating_system'
        attribute :capacity,   :aliases => 'status_node_info_kernel_version'
        attribute :labels,   :aliases => 'status_node_info_kernel_version'
        attribute :status,   :aliases => 'status_node_info_kernel_version'
        # attribute :create_time
        attribute :change_time,   :aliases => 'status_node_info_kernel_version'
        attribute :current_price,   :aliases => 'status_node_info_kernel_version'
        attribute :location_uuid,   :aliases => 'status_node_info_kernel_version'
        attribute :location_name,   :aliases => 'status_node_info_kernel_version'
        attribute :location_country,   :aliases => 'status_node_info_kernel_version'
        attribute :location_iata,   :aliases => 'status_node_info_kernel_version'
        attribute :relations,   :aliases => 'status_node_info_kernel_version'



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

          merge_attributes(data)
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
