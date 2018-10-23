require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Ip < Fog::Model
        identity :object_uuid

        attribute :current_price
        attribute :delete_block
        attribute :failover
        attribute :family
        attribute :ip
        attribute :labels
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_uuid
        attribute :object_uuid, :aliases => 'ipaddr_uuid'
        attribute :partner_uuid
        attribute :prefix
        attribute :relations
        attribute :reverse_dns
        attribute :status
        attribute :usage_in_minutes



        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :family

          options = {}
          if attributes[:labels]
            options[:labels] = labels
          end

          if attributes[:failover]
            options[:failover] = failover
          end

          if attributes[:name]
            options[:name] = name
          end

          if attributes[:reverse_dns]
            options[:reverse_dns] = reverse_dns
          end

          if attributes[:location_uuid]
            options[:location_uuid] = location_uuid
          end
          data = service.ip_create(family, options)

          merge_attributes(data.body)
          true
        end

        def delete
          requires :object_uuid
          response = service.ip_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.ip_delete(object_uuid)
          response
        end

        private


      end
    end
  end
end
