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

          create_options[:relations] = relation
          print (create_options)
          # create_options[:relations]['public_ips'] = []
          # "compute_attributes"=>{"cores"=>"1", "memory"=>"2","relations"=>{"public_ips"=>["ipaddr_uuid"=>'233192a8-165d-49fb-af80-58544e74bc44']}}

          # create_options[:relations] = {'isoimages'=>[],'networks'=>['network_uuid'=>'1044fdf2-a68e-467f-abfd-3b349b962707'],'public_ips'=>['ipaddr_uuid'=>options[:ipaddr_uuid]],'storages'=>[]}
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
