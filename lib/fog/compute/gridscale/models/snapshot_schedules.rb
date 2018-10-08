require 'fog/compute/gridscale/models/paging_collection'

module Fog
  module Compute
    class Gridscale
      class SnapshotSchedules < Fog::Compute::Gridscale::PagingCollection
        model Fog::Compute::Gridscale::SnapshotSchedule



        def all(filters={})
          data = service.snapshot_schedules_get(filters)
          snapshot_schedules = data.body["snapshot_schedules"].values
          load(snapshot_schedules)
        end


        def get(payload)
          snapshot_schedule = service.snapshot_schedule_get(payload).body['snapshot_schedule']
          new(snapshot_schedule) if snapshot_schedule
        rescue Fog::Errors::NotFound
          nil
        end
      end
    end
  end
end
