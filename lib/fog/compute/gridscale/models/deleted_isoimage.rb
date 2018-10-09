require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class DeletedIsoimage < Fog::Model
        identity :object_uuid

        attribute :capacity
        attribute :change_time
        attribute :create_time
        attribute :current_price
        attribute :description
        attribute :labels
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_uuid
        attribute :name
        attribute :object_uuid
        attribute :private
        attribute :relations
        attribute :source_url
        attribute :status
        attribute :usage_in_minutes
        attribute :version


      end
    end
  end
end
