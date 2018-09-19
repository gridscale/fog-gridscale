module Fog
  module Compute
    class Gridscale
      # noinspection RubyStringKeysInHashInspection
      class Real
        def server_create(name, cores, memory)

          create_options = {
              :name   => name,
              :location_uuid => "45ed677b-3702-4b36-be2a-a2eab9827950",
              :cores   => cores,
              :memory   => memory,
              :relations => {'isoimages'=>[],'networks'=>[{'network_uuid'=>'1044fdf2-a68e-467f-abfd-3b349b962707'}],'public_ips'=>[{'ipaddr_uuid'=>'8ba0a0be-757d-400f-a0c8-7e6e35a07006'}],'storages'=>[]}
          }

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
