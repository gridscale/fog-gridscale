require 'fog/compute/gridscale/models/isoimage'

module Fog
  module Compute
    class Gridscale
      class ServerRelationIsoimage < Fog::Model
        identity :object_uuid

        attribute :bootdevice
        attribute :create_time
        attribute :object_name
        attribute :object_uuid
        attribute :private
        attribute :server_uuid
        attribute :isoimage_uuid


        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :server_uuid, :isoimage_uuid

          options = {}
          if attributes[:bootdevice]
            options[:bootdevice] = bootdevice
          end

          service.server_relation_isoimage_create(server_uuid, isoimage_uuid, options)

        end

        def delete
          object_uuid = {}
          object_uuid[:server_uuid] = attributes[:server_uuid]
          object_uuid[:isoimage_uuid] = attributes[:isoimage_uuid]
          service.server_relation_isoimage_delete(server_uuid, isoimage_uuid)
        end

        def destroy
          # requires :server_uuid, :isoimage_uuid
          # payload={}
          # payload[:server_uuid] = attributes[:server_uuid]
          # payload[:isoimage_uuid] = attributes[:isoimage_uuid]
          #
          # pp :server_uuid
          # pp :object_uuid
          # pp "hooooooo"

          response = service.server_relation_isoimage_delete(object_uuid)
          response.body

        end

        private


      end
    end
  end
end
