require 'fog/core'
require 'fog/json'

module Fog
  module Compute
    autoload :Gridscale, File.expand_path('../compute/gridscale', __FILE__)
  end

  module Gridscale
    autoload :Service, File.expand_path('../gridscale/service')

    extend Fog::Provider
    service(:compute, 'Compute')
  end
end
