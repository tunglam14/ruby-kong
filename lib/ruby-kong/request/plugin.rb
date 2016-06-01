module RubyKong
  module Request
    module Plugin
      class << self
        def create(*args)
          path = RubyKong.paths[:plugin][:create]
          path.gsub!(':api_id', args[0][:api])
          Request.post(path, args[0][:plugin])
        end

        def list(*args)
          path = RubyKong.paths[:plugin][:list]
          Request.get(path, args[0])
        end

        def list_by_api(*args)
          path = RubyKong.paths[:plugin][:list_by_api]
          path.gsub!(':api_id', args[0][:api])
          Request.get(path, args[0][:filter])
        end

        def retrieve(*args)
          plugin_id = args[0][:id]
          path      = RubyKong.paths[:plugin][:retrieve]
          path.gsub!(':plugin_id', plugin_id)
          Request.get(path)
        end

        def retrieve_enabled(*args)
          path      = RubyKong.paths[:plugin][:retrieve_enabled]
          Request.get(path)
        end

        def retrieve_schema(*args)
          plugin_name = args[0][:plugin_name]
          path        = RubyKong.paths[:plugin][:retrieve_schema]
          path.gsub!(':plugin_name', plugin_name)
          Request.get(path)
        end

        def update(*args)
          api_id    = args[0][:api]
          plugin_id = args[0][:plugin]
          path      = RubyKong.paths[:plugin][:update]
          path.gsub!(':api_id', api_id)
          path.gsub!(':plugin_id', plugin_id)

          Request.patch(path, args[0][:params])
        end

        def delete(*args)
          resource = args[0][:username] || args[0][:id]
          path     = RubyKong.paths[:plugin][:update] + resource
          Request.delete(path, args[0])
        end
      end
    end # end of Plugin
  end # End of Request
end # End of RubyKong
