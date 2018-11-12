require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class PaasSecurityZone < Fog::Model
        identity :object_uuid

        attribute :name
        attribute :object_uuid
        attribute :location_uuid
        attribute :labels
        attribute :status
        attribute :create_time
        attribute :change_time
        attribute :location_name
        attribute :location_country
        attribute :location_iata
        attribute :relations

        def delete
          requires :object_uuid
          response = service.paas_security_zone_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.paas_security_zone_delete object_uuid
          response.body
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name

          options = {}

          if attributes[:labels]
            options[:labels] = labels
          end



          if attributes[:location_uuid]
            options[:location_uuid] = location_uuid
          end

          data = service.paas_security_zone_create(name, options)

          merge_attributes(data.body)
          true
        end

        def update
          requires :object_uuid
          data = service.paas_security_zone_update(object_uuid)
          merge_attributes(data.body)
          true
        end

      end
    end
  end
end
