module RubyKong
  module Request
    module Api
      class << self
        def create(*args)
          path = RubyKong.paths[:api][:create]
          Request.post(path, args[0])
        end

        def list(*args)
          path = RubyKong.paths[:api][:list]
          Request.get(path, args[0])
        end

        def retrieve(*args)
          resource = args[0][:name] || args[0][:id]
          path = RubyKong.paths[:api][:retrieve] + resource
          Request.get(path)
        end

        def update(*args)
          resource = args[0][:name] || args[0][:id]
          path     = RubyKong.paths[:api][:update] + resource
          Request.patch(path, args[0])
        end

        def delete(*args)
          resource = args[0][:name] || args[0][:id]
          path     = RubyKong.paths[:api][:update] + resource
          Request.delete(path, args[0])
        end
      end
    end # end of Api
  end # End of Request
end # End of RubyKong
