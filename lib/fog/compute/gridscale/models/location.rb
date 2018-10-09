require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Location < Fog::Model
        identity :object_uuid

        attribute :iata
        attribute :labels
        attribute :name
        attribute :object_uuid
        attribute :country
        attribute :status
      end
    end
  end
end
