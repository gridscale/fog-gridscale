require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class MarketplaceTemplate < Fog::Model
        identity :object_uuid

        attribute :name
        attribute :object_uuid
        attribute :capacity
        attribute :labels
        attribute :status
        attribute :create_time
        attribute :change_time
        attribute :object_storage_path
        attribute :template_type
        attribute :location_iata
        attribute :relations
        attribute :template
        attribute :unique_hash


        def delete
          requires :object_uuid
          response = service.marketplace_template_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.marketplace_template_delete object_uuid
          response.body
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?

          options = {}

          if attributes[:name]
            options[:name] = name
          end

          if attributes[:labels]
            options[:labels] = labels
          end

          if attributes[:capacity]
            options[:capacity] = capacity
          end

          if attributes[:object_storage_path]
            options[:object_storage_path] = object_storage_path
          end

          if attributes[:unique_hash]
            options[:unique_hash] = unique_hash
          end

          data = service.marketplace_template_create(options)


          merge_attributes(data.body)
          true
        end

      end
    end
  end
end
