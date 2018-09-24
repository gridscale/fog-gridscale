module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def server_create(name, cores, memory, relations = {})

          create_options = {
              :name   => name,
              :location_uuid => "45ed677b-3702-4b36-be2a-a2eab9827950",
              :cores   => cores,
              :memory   => memory,
              # :relations => {'isoimages'=>[],'networks'=>[],'public_ips'=>['ipaddr_uuid'=>ipaddr_uuid],'storages'=>[]}
          }
          relation = {
              :isoimages => [],
              :networks => [],
              :public_ips => [],
              :storages => [],

          }


          if relations[:ipaddr_uuid] != nil && relations[:ipaddr_uuid] != ""
            relation[:public_ips] = [:ipaddr_uuid => relations[:ipaddr_uuid]]
          else
            relation[:public_ips] = Array([])
          end

          if relations[:network_uuid] != nil &&  relations[:network_uuid] != ""
            relation[:networks] = [:network_uuid => relations[:network_uuid]]
          else
            relation[:networks] = Array([])
          end

          if relations[:storage_uuid] != nil &&  relations[:storage_uuid] != ""
            relation[:storages] = [:storage_uuid => relations[:storage_uuid]]
          else
            relation[:storages] = Array([])
          end

          create_options[:relations] = relation
          encoded_body = Fog::JSON.encode(create_options)

          request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/servers',
              :body    => encoded_body,
              )
        end
      end
    end
  end
end
