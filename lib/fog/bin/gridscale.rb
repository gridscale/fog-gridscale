class Gridscale < Fog::Bin
  class << self
    def class_for(key)
      case key
      when :compute
        Fog::Compute::Gsstorage
      else
        raise ArgumentError, "Unsupported #{self} service: #{key}"
      end
    end

    def [](service)
      @@connections ||= Hash.new do |hash, key|
        hash[key] = case key
                    when :compute
                      Fog::Logger.warning("Gsstorage[:compute] is not recommended, use Compute[:gsstorage] for portability")
                      Fog::Compute.new(:provider => 'gridscale')
                    else
                      raise ArgumentError, "Unrecognized service: #{key.inspect}"
                    end
      end
      @@connections[service]
    end

    def services
      Fog::Gsstorage.services
    end
  end
end
