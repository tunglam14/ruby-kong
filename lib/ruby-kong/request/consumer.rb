module RubyKong
  module Request
    module Consumer
      class << self
        def create(*args)
          path = RubyKong.paths[:consumer][:create]
          Request.post(path, args[0])
        end

        def list(*args)
          path = RubyKong.paths[:consumer][:list]
          Request.get(path, args[0])
        end

        def retrieve(*args)
          resource = args[0][:username] || args[0][:id]
          path     = RubyKong.paths[:consumer][:retrieve] + resource
          Request.get(path)
        end

        def update(*args)
          resource = args[0][:username] || args[0][:id]
          path     = RubyKong.paths[:consumer][:update] + resource
          Request.patch(path, args[0])
        end

        def delete(*args)
          resource = args[0][:username] || args[0][:id]
          path     = RubyKong.paths[:consumer][:update] + resource
          Request.delete(path, args[0])
        end
      end
    end # end of Consumer
  end # End of Request
end # End of RubyKong
