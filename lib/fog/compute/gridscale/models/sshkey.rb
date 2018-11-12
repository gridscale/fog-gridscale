require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Sshkey < Fog::Model
        identity :object_uuid

        attribute :change_time
        attribute :create_time
        attribute :labels
        attribute :name
        attribute :object_uuid
        attribute :sshkey
        attribute :status
        attribute :user_uuid

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :sshkey

          options = {}

          if attributes[:labels]
            options[:labels] = labels
          end

          data = service.sshkey_create(name, sshkey, options)

          merge_attributes(data.body)
          true
        end

        def delete
          requires :object_uuid
          response = service.sshkey_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.sshkey_delete(object_uuid)
          response
        end

      end
    end
  end
end
