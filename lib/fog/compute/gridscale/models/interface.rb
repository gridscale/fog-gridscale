require 'fog/compute/gridscale/models/storage'

module Fog
  module Compute
    class Gridscale
      class Interface < Fog::Model
        identity :object_uuid

        attribute :account_uuid
        attribute :change_time
        attribute :create_time
        attribute :delete_block
        attribute :l2security
        attribute :labels
        attribute :location_country
        attribute :location_iata
        attribute :location_name
        attribute :location_uuid
        attribute :name
        attribute :network_type
        attribute :object_uuid
        attribute :public_net
        attribute :relations
        attribute :status
        attribute :ipaddr_uuid
        attribute :network_uuid
        attribute :mac
        attribute :bootable
        attribute :server_uuid

        def all(_filters = {})
          requires :vm
          if vm.is_a? Fog::Compute::Ovirt::Server
            load service.list_vm_interfaces(vm.id)
          elsif vm.is_a? Fog::Compute::Ovirt::Template
            load service.list_template_interfaces(vm.id)
          else
            raise ::Fog::Ovirt::Errors::OvirtError, "interfaces should have vm or template"
          end
        end
      end
    end
  end
end
