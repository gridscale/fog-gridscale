require "fog/core"
require "pp"
require "json"

module Fog
  module Compute
    class Gridscale < Fog::Service
      autoload :PagingCollection, File.expand_path('../gridscale/models/paging_collection', __FILE__)

      requires :api_token , :user_uuid
      # attributes :host

      model_path 'fog/compute/gridscale/models'
      model :storage
      collection :storages
      model :server
      collection :servers
      model :network
      collection :networks
      model :ip
      collection :ips
      model :interface
      collection :interfaces
      model :cas
      collection :cass
      model :loadbalancer
      collection :loadbalancers
      model :server_relation_storage
      collection :server_relation_storages
      model :server_relation_network
      collection :server_relation_networks
      model :server_relation_ip
      collection :server_relation_ips
      model :server_relation_isoimage
      collection :server_relation_isoimages
      model :sshkey
      collection :sshkeys
      model :snapshot
      collection :snapshots
      model :snapshot_schedule
      collection :snapshot_schedules
      model :template
      collection :templates
      model :location
      collection :locations
      model :request
      collection :requests
      model :access_key
      collection :access_keys
      model :bucket
      collection :buckets
      model :firewall
      collection :firewalls
      model :deleted_ip
      collection :deleted_ips
      model :deleted_network
      collection :deleted_networks
      model :deleted_server
      collection :deleted_servers
      model :deleted_storage
      collection :deleted_storages
      model :deleted_isoimage
      collection :deleted_isoimages
      model :deleted_snapshot
      collection :deleted_snapshots
      model :deleted_template
      collection :deleted_templates
      model :isoimage
      collection :isoimages
      model :paas_service
      collection :paas_services
      model :paas_security_zone
      collection :paas_security_zones
      model :marketplace_template
      collection :marketplace_templates

      request_path 'fog/compute/gridscale/requests'

      #storage
      request :storage_delete
      request :storage_create
      request :storage_get
      request :storage_events_get
      request :storages_get
      request :storage_update

      #server
      request :servers_get
      request :server_get
      request :server_delete
      request :server_create
      request :server_update

      request :server_shutdown
      request :server_power_off
      request :server_power_on
      request :server_power_get

      request :server_relation_ips_get
      request :server_relation_ip_get
      request :server_relation_ip_delete
      request :server_relation_ip_create

      request :server_relation_storages_get
      request :server_relation_storage_get
      request :server_relation_storage_delete
      request :server_relation_storage_create
      request :server_relation_storage_update

      request :server_relation_networks_get
      request :server_relation_network_get
      request :server_relation_network_delete
      request :server_relation_network_create
      request :server_relation_network_update

      request :server_relation_isoimages_get
      request :server_relation_isoimage_get
      request :server_relation_isoimage_delete
      request :server_relation_isoimage_create
      request :server_relation_isoimage_update

      request :server_events_get
      request :server_shutdown

      #network
      request :network_delete
      request :network_create
      request :network_get
      request :network_events_get
      request :networks_get
      request :network_update

      #ip
      request :ip_delete
      request :ip_create
      request :ip_get
      request :ip_events_get
      request :ips_get
      request :ip_update

      #isoimage
      request :isoimage_delete
      request :isoimage_create
      request :isoimage_get
      request :isoimage_events_get
      request :isoimages_get
      request :isoimage_update

      #cas
      request :cas_create
      request :cass_get
      request :cas_delete
      request :cas_get
      request :cas_update
      request :cas_events_get
      request :cas_actions_get

      #snapshot
      request :snapshot_create
      request :snapshots_get
      request :snapshot_delete
      request :snapshot_get
      request :snapshot_update

      #snapshot_schedule
      request :snapshot_schedule_create
      request :snapshot_schedules_get
      request :snapshot_schedule_delete
      request :snapshot_schedule_get
      request :snapshot_schedule_update


      #template
      request :template_delete
      request :template_create
      request :template_get
      request :template_events_get
      request :templates_get
      request :template_update

      #deleted object
      request :deleted_ips_get
      request :deleted_isoimages_get
      request :deleted_networks_get
      request :deleted_servers_get
      request :deleted_snapshots_get
      request :deleted_storages_get
      request :deleted_templates_get

      #load balancer
      request :load_balancer_delete
      request :load_balancer_create
      request :load_balancer_get
      request :load_balancer_events_get
      request :load_balancers_get
      request :load_balancer_update

      #firewall
      request :firewall_delete
      request :firewall_create
      request :firewall_get
      request :firewall_events_get
      request :firewalls_get
      request :firewall_update

      #marketplace template
      request :marketplace_template_delete
      request :marketplace_template_create
      request :marketplace_template_get
      request :marketplace_template_events_get
      request :marketplace_templates_get
      request :marketplace_template_update

      #request
      request :request_get

      #Object Storage
      request :access_keys_get
      request :access_key_get
      request :access_key_create
      request :access_key_delete
      request :buckets_get
      request :bucket_get

      #sshkey
      request :sshkey_create
      request :sshkey_get
      request :sshkeys_get
      request :sshkey_delete
      request :sshkey_update

      #location
      request :location_get
      request :locations_get

      #paas service
      request :paas_service_create
      request :paas_service_get
      request :paas_services_get
      request :paas_service_delete
      request :paas_service_update

      #paas security zone
      request :paas_security_zone_create
      request :paas_security_zone_get
      request :paas_security_zones_get
      request :paas_security_zone_delete
      request :paas_security_zone_update

      #marketplace template
      request :marketplace_template_create
      request :marketplace_template_get
      request :marketplace_templates_get
      request :marketplace_template_delete
      request :marketplace_template_update

      class Mock
        def self.data
          @data ||= Hash.new do |hash, key|
            hash[key] = {
                :storage  => [],
                # :ssh_keys => []
            }
          end
        end

        def initialize(options={})
          @api_token = options[:api_token]
          @user_uuid = options[:user_uuid]

        end

        def data
          self.class.data[@api_token]
          self.class.data[@user_uuid]
        end

        def reset_data
          self.class.data.delete(@api_token)
          self.class.data.delete(@user_uuid)
        end
      end

      class Real
        def initialize(options={})
          api_token = options[:api_token]
          user_uuid = options[:user_uuid]
          host = options[:host]

          persistent         = false

          options            = {
              headers: {
                  'X-Auth-UserId' => "#{user_uuid}",
                  'X-Auth-Token' => "#{api_token}",
              }
          }
          if host
            @connection = Fog::Core::Connection.new host, persistent, options
          else
            @connection = Fog::Core::Connection.new 'https://api.gridscale.io', persistent, options
          end

        end

        def request(params)
          params[:headers] ||= {}
          begin
            response = @connection.request(params)
          rescue Excon::Errors::HTTPStatusError => error
            raise case error.response.body
                  when Excon::Errors::NotFound
                    NotFound.slurp(error.response.body)
                  else
                    error.response.body
                  end
          end
          unless response.body.empty?
            response.body = Fog::JSON.decode(response.body)
          end
          response
        end
      end
    end
  end
end
