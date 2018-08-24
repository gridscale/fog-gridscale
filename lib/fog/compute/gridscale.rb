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
      request :delete_storage
      request :create_storage
      request :get_storage
      request :get_storages
      request :update_storage

      #server
      request :get_servers
      request :get_server
      request :delete_server
      request :create_server
      request :update_server



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
          pp response.body
        end
      end
    end
  end
end
