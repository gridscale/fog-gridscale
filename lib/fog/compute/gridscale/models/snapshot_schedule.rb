require 'fog/compute/gridscale/models/snapshot'

module Fog
  module Compute
    class Gridscale
      class SnapshotSchedule < Fog::Model
        identity :object_uuid

        attribute :change_time
        attribute :create_time
        attribute :keep_snapshots
        attribute :labels
        attribute :name
        attribute :next_runtime
        attribute :object_uuid
        attribute :relations
        attribute :run_interval
        attribute :status
        attribute :storage_uuid



        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :storage_uuid , :name, :run_interval, :keep_snapshots


          data = service.snapshot_schedule_create(storage_uuid, name, run_interval, keep_snapshots)

          merge_attributes(data.body)
          true
        end

        def delete
          requires :object_uuid
          response = service.ip_delete storage_uuid
          response.body
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

          response = service.snapshot_schedule_delete(object_uuid)
          response.body

        end

        private


      end
    end
  end
end
