require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      class AccessKey < Fog::Model
        identity :access_key

        attribute :access_key
        attribute :secret_key

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          # options = {}
          # options[:name] = attributes[:name]
          # options[:action_payload] = attributes[:action_payload]
          # options[:filters] = attributes[:event_type]
          # options[:action_type] = attributes[:action_type]
          # options[:event_type] = attributes[:event_type]

          data = service.access_key_create
          merge_attributes(data.body['access_key'])
          true
        end

        def destroy
          requires :access_key
          response = service.access_key_delete access_key
          response.body
        end


        private
      end
    end
  end
end
