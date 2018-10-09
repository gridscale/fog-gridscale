require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      class Bucket < Fog::Model
        identity :name

        attribute :usage
        attribute :name



      end
    end
  end
end
