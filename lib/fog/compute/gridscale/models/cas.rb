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



        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :action_payload,:filters, :event_type, :action_type

          # options = {}
          # options[:name] = attributes[:name]
          # options[:action_payload] = attributes[:action_payload]
          # options[:filters] = attributes[:event_type]
          # options[:action_type] = attributes[:action_type]
          # options[:event_type] = attributes[:event_type]

          data = service.cas_create(name, action_payload,filters, event_type, action_type)
          merge_attributes(data.body)
          true
        end

        def delete
          requires :object_uuid
          response = service.cas_delete object_uuid
          response.body
        end


        private
      end
    end
  end
end
