require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      class Cas < Fog::Model
        identity :object_uuid

        attribute :event_type
        attribute :filters
        attribute :name
        attribute :executing_user_uuid
        attribute :active
        attribute :labels
        attribute :action_type
        attribute :executing_user_token
        attribute :action_payload
        attribute :change_time
        attribute :create_time
        attribute :object_uuid
        attribute :location_uuid

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :action_payload,:filters, :event_type, :action_type, :labels

          options ={}

          if attributes[:labels]
            options[:labels] = labels
          end

          if attributes[:location_uuid]
            options[:location_uuid] = labels
          end

          data = service.cas_create(name, action_payload,filters, event_type, action_type, options)
          merge_attributes(data.body)
          true
        end

        def destroy
          requires :object_uuid
          response = service.cas_delete object_uuid
          response.body
        end

      end
    end
  end
end
