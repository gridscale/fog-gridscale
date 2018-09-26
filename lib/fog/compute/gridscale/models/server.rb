require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      # A DigitalOcean Droplet
      #
      class Server < Fog::Compute::Server
        identity :object_uuid

        attribute :auto_recovery
        attribute :availability_zone
        attribute :current_price
        attribute :power
        attribute :status
        attribute :cores
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
        attribute :object_uuid
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
        attribute :sotrages
        attribute :storage_uuid
        attribute :interfaces
        attribute :mac

        def public_ip_address
          ipv4_address
        end

        def ipv4_address
          if (net = relations['public_ips'].find {|n|n['family']==4})
            net['ip']
          end
        end

        def ipv6_address
          if (net = relations['public_ips'].find {|n|n['family']==6})
            net['ip']
          end
        end

        # def mac
        #   require :server_uuid
        #   if service.server_get(:server_uuid).relations['networks']
        #     service.server_get(:server_uuid).relations['networks'].each do |network|
        #       network['mac']
        #     end
        #   end
        # end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :cores, :memory, :storage, :interfaces_attributes
          relations = {
            :isoimages => [],
          }

	        networks = []
          public_ips = []
          storages = []
          interfaces_attributes.each do |key, value|
            if value["ipaddr_uuid"].present? && value["ipaddr_uuid"] != ""
              public_ips << {"ipaddr_uuid"=>value["ipaddr_uuid"]}
            end
            if value["network_uuid"].present? && value["network_uuid"] != ""
              networks << {"network_uuid"=>value["network_uuid"]}
            end
          end
          if storage.present? && storage > 0
            storages << {"create"=>{"name"=>"#{name} Storage", "capacity"=>storage, "location_uuid"=>"45ed677b-3702-4b36-be2a-a2eab9827950","storage_type"=>"storage"}, "relation"=>{"bootdevice"=>true}}
          end 
          relations[:public_ips] = public_ips
          relations[:networks] = networks
          relations[:storages] = storages

          data = service.server_create(name, cores, memory, relations)

          merge_attributes(data.body)
          true
        end

        def delete
          requires :object_uuid
          response = service.server_delete object_uuid
          response.body
        end

        def destroy
          requires :object_uuid
          response = service.server_delete(object_uuid)
          response
        end

        def start
          response = service.server_power_on(object_uuid)
          response.body
        end

        def shutdown
          requires :object_uuid
          response = service.server_shutdown(object_uuid)
          response
        end

        def stop
          requires :object_uuid
          response = service.server_power_off(object_uuid)
          response
        end

        def ready?
          requires :object_uuid
          response = service.server_power_get(object_uuid)
          response.body['power']
        end

        private
      end
    end
  end
end
