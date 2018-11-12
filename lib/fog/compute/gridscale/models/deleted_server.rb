require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      class DeletedServer < Fog::Model
        identity :object_uuid

        attribute :auto_recovery
        attribute :availability_zone
        attribute :current_price
        attribute :power
        attribute :status
        attribute :cores, :aliases => 'cpu'
        attribute :name
        attribute :storage
        attribute :interfaces_attributes
        attribute :location_uuid
        attribute :usage_in_minutes_cores
        attribute :labels
        attribute :hardware_profile
        attribute :location_iata
        attribute :location_name
        attribute :legacy
        attribute :memory
        attribute :object_uuid, :aliases => 'server_uuid'
        attribute :server_uuid
        attribute :create_time
        attribute :relations
        attribute :usage_in_minutes_memory
        attribute :change_time
        attribute :console_token
        attribute :location_country
        attribute :ipaddr_uuid
        attribute :network_uuid
        attribute :public_ips
        attribute :networks
        attribute :storages
        attribute :storage_uuid
        attribute :interfaces
        attribute :mac
        attribute :cpu

      end
    end
  end
end
