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

        # def public_ip_address
        #   ipv4_address
        # end
        #
        # def ipv6_address
        #   if (net = networks['v6'].find { |n| n['type'] == 'public' })
        #     net['ip_address']
        #   end
        # end
        #
        # def ipv4_address
        #   if (net = networks['v4'].find { |n| n['type'] == 'public' })
        #     net['ip_address']
        #   end
        # end
        #
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
          response = service.server_shutdown(object_uuid)
          response
        end

         def ready?
		requires :object_uuid
		response = service.server_power_get(object_uuid)
		response.body['power']
         end

        # def actions
        #   requires :id
        #   response = service.list_droplet_actions id
        #   response.body
        # end
        #
        # def action(action_id)
        #   requires :id
        #   response = service.get_droplet_action(id, action_id)
        #   response.body
        # end

        # def reboot
        #   perform_action :reboot_server
        # end
        #
        # def disable_backups
        #   perform_action :disable_backups
        # end
        #
        # def power_cycle
        #   perform_action :power_cycle
        # end
        #
        # def shutdown
        #   perform_action :shutdown
        # end
        #
        # def power_off
        #   perform_action :power_off
        # end
        #
        # def power_on
        #   perform_action :power_on
        # end
        #
        # def restore(image)
        #   perform_action :restore, image
        # end
        #
        # def password_reset
        #   perform_action :password_reset
        # end
        #
        # def resize(resize_disk, size)
        #   perform_action :resize, resize_disk, size
        # end
        #
        # def rebuild(image)
        #   perform_action :rebuild, image
        # end
        #
        # def rename(name)
        #   perform_action :rename, name
        # end
        #
        # def change_kernel(kernel)
        #   perform_action :change_kernel, kernel
        # end
        #
        # def enable_ipv6
        #   perform_action :enable_ipv6
        # end
        #
        # def enable_private_networking
        #   perform_action :enable_private_networking
        # end
        #
        # def snapshot(name)
        #   perform_action :snapshot, name
        # end
        #
        # def upgrade
        #   perform_action :upgrade
        # end

        private

        # Performs a droplet action with the given set of arguments.
        # def perform_action(action, *args)
        #   requires :id
        #   response = service.send(action, id, *args)
        #   response.body
        # end
      end
    end
  end
end
