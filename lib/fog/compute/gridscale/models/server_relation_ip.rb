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


        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :server_uuid, :ip_uuid

          # payload = {}
          # payload[:object_uuid ] = attributes[:object_uuid]

          pp :server_uuid

          service.server_relation_ip_create(server_uuid, ip_uuid)

        end

        def delete
          object_uuid = {}
          object_uuid[:server_uuid] = attributes[:server_uuid]
          object_uuid[:ip_uuid] = attributes[:ip_uuid]
          service.server_relation_ip_delete(server_uuid, ip_uuid)
        end

        def destroy
          # requires :server_uuid, :ip_uuid
          # payload={}
          # payload[:server_uuid] = attributes[:server_uuid]
          # payload[:ip_uuid] = attributes[:ip_uuid]
          #
          # pp :server_uuid
          # pp :object_uuid
          # pp "hooooooo"

          response = service.server_relation_ip_delete(object_uuid)
          response.body

        end

        private


      end
    end
  end
end
