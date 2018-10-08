require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class Sshkeys < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::Sshkey



        def all(filters={})
          data = service.sshkeys_get(filters)
          sshkeys = data.body["sshkeys"].values
          load(sshkeys)
        end


        def get(sshkey_uuid)

          sshkey = service.sshkey_get(sshkey_uuid).body['sshkey']
          new(sshkey) if sshkey
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
