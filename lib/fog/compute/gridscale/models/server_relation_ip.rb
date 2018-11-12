require 'fog/compute/gridscale/models/ip'

module Fog
  module Compute
    class Gridscale
      class ServerRelationIp < Fog::Model
        identity :object_uuid

        attribute :create_time
        attribute :family
        attribute :ip
        attribute :object_uuid
        attribute :prefix
        attribute :server_uuid
        attribute :ip_uuid
        attribute :bootdevice


        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :server_uuid, :ip_uuid

          options = {}
          if attributes[:bootdevice]
            options[:bootdevice] = bootdevice
          end

          service.server_relation_ip_create(server_uuid, ip_uuid, options)

        end

        def delete
          object_uuid = {}
          object_uuid[:server_uuid] = attributes[:server_uuid]
          object_uuid[:ip_uuid] = attributes[:ip_uuid]
          service.server_relation_ip_delete(server_uuid, ip_uuid)
        end

        def destroy

          response = service.server_relation_ip_delete(object_uuid)
          response.body

        end

        private


      end
    end
  end
end
