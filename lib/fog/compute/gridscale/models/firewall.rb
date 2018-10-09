require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      class Firewall < Fog::Model
        identity :object_uuid

        attribute :change_time
        attribute :create_time
        attribute :labels
        attribute :name
        attribute :object_uuid
        attribute :rules
        attribute :status
        attribute :private



        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :rules

          # options = {}
          # options[:name] = attributes[:name]
          # options[:action_payload] = attributes[:action_payload]
          # options[:filters] = attributes[:event_type]
          # options[:action_type] = attributes[:action_type]
          # options[:event_type] = attributes[:event_type]

          data = service.firewall_create(name, rules)
          merge_attributes(data.body)
          true
        end

        def destroy
          requires :object_uuid
          response = service.firewall_delete object_uuid
          response.body
        end


        private
      end
    end
  end
end
