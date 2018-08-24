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
        attribute :location_uuid
        attribute :usage_in_minutes_cores
        attribute :labels
        attribute :hardware_profile
        attribute :location_iata
        attribute :location_name
        attribute :legacy
        attribute :memory
        attribute :create_time
        attribute :relations
        attribute :usage_in_minutes_memory
        attribute :change_time
        attribute :console_token
        attribute :location_country

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

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :cores, :memory



          data = service.create_server(name, cores, memory)

          merge_attributes(data.body['server'])
          true
        end

        def delete
          requires :object_uuid
          response = service.delete_server object_uuid
          response.body
        end

        # def ready?
        #   status == 'active'
        # end


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
