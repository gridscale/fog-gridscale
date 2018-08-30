require "fog/core"
require "pp"

module Fog
  module Compute
    class Gridscale < Fog::Service
      autoload :PagingCollection, File.expand_path('../gridscale/models/paging_collection', __FILE__)

      requires :api_token , :user_uuid

      model_path 'fog/compute/gridscale/models'
      model :storage
      collection :storages
      model :server
      collection :servers


      request_path 'fog/compute/gridscale/requests'

      #storage
      request :storage_delete
      request :storage_create
      request :storage_get
      request :storages_get
      request :storage_update

      #server
      request :servers_get
      request :server_get
      request :server_delete
      request :server_create
      request :server_update

      request :server_power_off
      request :server_power_on
      request :server_power_get

      request :server_relation_ipaddrs_get
      request :server_relation_ipaddr_get
      request :server_relation_ipaddr_remove
      request :server_relation_ipaddr_add

      request :server_relation_storages_get
      request :server_relation_storage_get
      request :server_relation_storage_remove
      request :server_relation_storage_add
      request :server_relation_storage_update

      request :server_relation_networks_get
      request :server_relation_network_get
      request :server_relation_network_remove
      request :server_relation_network_add
      request :server_relation_network_update

      request :server_relation_isoimages_get
      request :server_relation_isoimage_get
      request :server_relation_isoimage_remove
      request :server_relation_isoimage_add
      request :server_relation_isoimage_update

      #network
      request :network_delete
      request :network_create
      request :network_get
      request :networks_get
      request :network_update

      #ip
      request :ip_delete
      request :ip_create
      request :ip_get
      request :ips_get

      #isoimage
      request :isoimage_remove
      request :isoimage_add
      request :isoimage_get
      request :isoimages_get
      request :isoimage_update

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

          persistent         = false

          options            = {
              headers: {
                  'X-Auth-UserId' => "#{user_uuid}",
                  'X-Auth-Token' => "#{api_token}",
              }
          }
          @connection        = Fog::Core::Connection.new 'https://api.gridscale.io', persistent, options
        end

        def request(params)
          params[:headers] ||= {}
          begin
            response = @connection.request(params)
          rescue Excon::Errors::HTTPStatusError => error
            raise case error
                  when Excon::Errors::NotFound
                    NotFound.slurp(error)
                  else
                    error
                  end
          end
          unless response.body.empty?
            response.body = Fog::JSON.decode(response.body)
          end
          return response.body
        end
      end
    end
  end
end
