require 'fog/compute/models/server'
require 'fog/core'
module Fog
  module Compute
    class Gridscale
      class Server < Fog::Compute::Server
        identity :object_uuid

        attribute :auto_recovery
        attribute :availability_zone
        attribute :current_price
        attribute :power
        attribute :status
        attribute :cores, :aliases => 'cpu'
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
        attribute :storages
        attribute :storage_uuid
        attribute :interfaces
        attribute :mac
        attribute :cpu
        attribute :request_uuid
        attribute :template_uuid
        attribute :ipv4_address
        attribute :ipv6_address
        attribute :ip_addresses
        attribute :sshkey_uuid
        attribute :ip4_add_in
        attribute :ip6_add_in
        attribute :isoimage_uuid


        def cpu
          cores
        end

        def public_ip_address
          ipv4_address
        end

        def ipv4_address
          if (net = relations['public_ips'].find {|n|n['family']==4})
            net['ip']
          end
        end

        def mac
          if relations['networks'] and relations['networks'] != []
            if relations['networks'].first
              if relations['networks'].first['mac'] != nil
                relations['networks'].first['mac'].to_s
              else
                nil
              end
            end
          end
        end

        def interfaces
          requires :object_uuid
          service.server_relation_networks.all(object_uuid)
        end

        def ipv6_address
          if (net = relations['public_ips'].find {|n|n['family']==6})
            net['ip']
          end
        end

        def save
          raise Fog::Errors::Error.new('Re-saving an existing object may create a duplicate') if persisted?
          requires :name, :cores, :memory

          options = {}
          if attributes[:interfaces_attributes]
            options[:interfaces_attributes] = attributes[:interfaces_attributes]
          end

          if attributes[:storage]
            options[:storage] = attributes[:storage]
          end

          if attributes[:labels]
            options[:labels] = attributes[:labels]
          end

          if attributes[:auto_recovery]
            options[:auto_recovery] = auto_recovery
          end

          if attributes[:hardware_profile]
            options[:hardware_profile] = hardware_profile
          end

          if attributes[:availability_zone]
            options[:availability_zone] = availability_zone
          end

          if attributes[:location_uuid]
            options[:location_uuid] = location_uuid
          end

          if attributes[:template_uuid]
            options[:template_uuid] = template_uuid
          end

          if attributes[:sshkey_uuid]
            options[:sshkey_uuid] = sshkey_uuid
          end

          if attributes[:isoimage_uuid]
            options[:isoimage_uuid] = isoimage_uuid
          end

          data = service.server_create(name, cores, memory, options)
          merge_attributes(data.body['server'])
        end

        def delete
          requires :object_uuid
          response = service.server_delete(object_uuid)
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

      end
    end
  end
end
