require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class DeletedNetwork < Fog::Model
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

      end
    end
  end
end
