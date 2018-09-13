require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Network < Fog::Model
        identity :object_uuid

        attribute :account_uuid
        attribute :change_time
        attribute :create_time
        attribute :delete_block
        attribute :l2security
        attribute :labels
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_uuid
        attribute :name
        attribute :network_type
        attribute :object_uuid
        attribute :public_net
        attribute :relations
        attribute :status



        def delete
          requires :object_uuid
          response = service.network_delete object_uuid
          response.body
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :location_uuid

          payload = {}

          data = service.network_create(payload)

          merge_attributes(data)
          true
        end

        def update
          requires :object_uuid

          payload = {}

          data = service.network_update(object_uuid, payload)
          merge_attributes(data.body)
          true
        end
      end
    end
  end
end
