require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Request < Fog::Model
        identity :object_uuid

        attribute :create_time
        attribute :message
        attribute :status

      end
    end
  end
end
