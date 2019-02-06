module Fog
  module Compute
    class Gridscale
      class Real

        def server_create(name, cores, memory, options = {})

          interfaces_attributes = options[:interfaces_attributes]
          storage = options[:storage]
          template_uuid = options[:template_uuid]
          sshkey_uuid = options[:sshkey_uuid]
          if options[:location_uuid]
            location_uuid = options[:location_uuid]
          else
            location_uuid= '45ed677b-3702-4b36-be2a-a2eab9827950'
          end


          relations = {
              :isoimages => [],
          }

          networks = []
          storages = []
          ipaddrs = []
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

              if value["ipv4_uuid"] !=nil && value["ipv4_uuid"] != ""
                  ipaddrs << {"ipaddr_uuid"=>value["ipv4_uuid"]}
              end

              if value["ipv6_uuid"] !=nil && value["ipv6_uuid"] != ""
                ipaddrs << {"ipaddr_uuid"=>value["ipv6_uuid"]}
              end

            end
          end
          if sshkey_uuid == ""
            sshkey_uuid = nil
          end
          if storage != nil && storage > 0
            if template_uuid !=nil
              storages << {"create"=>{"name"=>"#{name} Storage", "capacity"=>storage, "location_uuid"=>location_uuid,"storage_type"=>"storage","template"=>{"template_uuid"=> template_uuid }} , "relation"=>{"bootdevice"=>true}}

              if sshkey_uuid != nil
                storages = []
                storages << {"create"=>{"name"=>"#{name} Storage", "capacity"=>storage, "location_uuid"=>location_uuid,"storage_type"=>"storage","template"=>{"template_uuid"=> template_uuid, "sshkeys" => [sshkey_uuid] }} , "relation"=>{"bootdevice"=>true}}
              else
                storages = []
                storages << {"create"=>{"name"=>"#{name} Storage", "capacity"=>storage, "location_uuid"=>location_uuid,"storage_type"=>"storage","template"=>{"template_uuid"=> template_uuid}} , "relation"=>{"bootdevice"=>true}}
              end
            else
              storages << {"create"=>{"name"=>"#{name} Storage", "capacity"=>storage, "location_uuid"=>location_uuid,"storage_type"=>"storage"}, "relation"=>{"bootdevice"=>true}}
            end
          end

          relations[:networks] = networks
          relations[:storages] = storages
          relations[:public_ips] = ipaddrs

          create_options = {
              :name   => name,
              :location_uuid => location_uuid,
              :cores   => cores,
              :memory   => memory,
              :relations => relations,
          }

          if options[:labels]
            create_options[:labels] = options[:labels]
          end

          if options[:auto_recovery]
            create_options[:auto_recovery] = options[:auto_recovery]
          end

          if options[:availability_zone]
            create_options[:availability_zone] = options[:availability_zone]
          end

          if options[:hardware_profile]
            create_options[:hardware_profile] = options[:hardware_profile]
          end
          # print create_options
          encoded_body = Fog::JSON.encode(create_options)
          x = request(
              :expects => [202],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'POST',
              :path    => '/objects/servers',
              :body    => encoded_body,
              )
          server_uuid = x.body['server_uuid']
          request(
              :expects => [200],
              :headers => {
                  'Content-Type' => "application/json; charset=UTF-8",
              },
              :method  => 'GET',
              :path    => "/objects/servers/#{server_uuid}",
              )

        end
      end
    end
  end
end
