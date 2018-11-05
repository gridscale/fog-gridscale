require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Interface < Fog::Model
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
        attribute :ipaddr_uuid
        attribute :network_uuid
        attribute :mac
        attribute :bootable
        attribute :server_uuid

        def to_s
          :name
        end

        def type
          :network_type
        end

      end
    end
  end
end
