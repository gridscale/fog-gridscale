require 'fog/compute/gridscale/models/paas_service'

module Fog
  module Compute
    class Gridscale
      class PaasService < Fog::Model
        identity :object_uuid

        attribute :name
        attribute :object_uuid
        attribute :labels
        attribute :status
        attribute :create_time
        attribute :change_time
        attribute :current_price
        attribute :listen_port
        attribute :security_zone_uuid
        attribute :paas_service_template_uuid
        attribute :usage_in_minutes
        attribute :parameters
        attribute :credential
        attribute :resource_limit



        def delete
          requires :object_uuid
          response = service.paas_service_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.paas_service_delete object_uuid
          response.body
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :paas_service_template_uuid

          options = {}

          if attributes[:labels]
            options[:labels] = labels
          end

          data = service.paas_service_create(name, paas_service_template_uuid, options)

          merge_attributes(data.body)
          true
        end

        def update
          requires :object_uuid
          data = service.paas_service_update(object_uuid)
          merge_attributes(data.body)
          true
        end
      end
    end
  end
end
