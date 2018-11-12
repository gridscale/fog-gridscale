require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      class AccessKey < Fog::Model
        identity :access_key

        attribute :access_key
        attribute :secret_key

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?

          data = service.access_key_create
          merge_attributes(data.body['access_key'])
          true
        end

        def destroy
          requires :access_key
          response = service.access_key_delete access_key
          response.body
        end
      end
    end
  end
end
