module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def server_create(name, cores, memory, options = {})


          interfaces_attributes = options[:interfaces_attributes]
          storage = options[:storage]

          relations = {
              :isoimages => [],
              :public_ips => [],
          }

          networks = []
          storages = []
          bootable_set = false
          if interfaces_attributes != nil
            interfaces_attributes.each do |key, value|
              if value["network_uuid"] !=nil && value["network_uuid"] != ""
                if bootable_set == false && value["bootable"] == "1"
                  networks << {"network_uuid"=>value["network_uuid"], "bootdevice"=>true}
                  bootable_set = true
                else
                  networks << {"network_uuid"=>value["network_uuid"]}
                end
              end
            end
          end

          if storage != nil && storage > 0
            storages << {"create"=>{"name"=>"#{name} Storage", "capacity"=>storage, "location_uuid"=>"45ed677b-3702-4b36-be2a-a2eab9827950","storage_type"=>"storage"}, "relation"=>{"bootdevice"=>true}}
          end
          relations[:networks] = networks
          relations[:storages] = storages



          create_options = {
              :name   => name,
              :location_uuid => "45ed677b-3702-4b36-be2a-a2eab9827950",
              :cores   => cores,
              :memory   => memory,
              :relations => relations,
          }

          if options[:labels]
            create_options[:labels] = options[:labels]
          end

          encoded_body = Fog::JSON.encode(create_options)
          print(create_options)
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
