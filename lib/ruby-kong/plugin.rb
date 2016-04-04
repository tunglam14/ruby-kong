require 'ruby-kong/request/plugin'

module RubyKong
  module Plugin
    class << self
      # Params: api:,
      #         plugin: {name:, consumer_id: nil, config.{property}}
      #
      # Usage: RubyKong::Plugin.create api: 'shipit',
      #                                plugin: {name: 'key-auth'}
      def create(*args)
        RubyKong::Request::Plugin.create args[0]
      end

      # Params: id, name, api_id, consumer_id, size, offset
      #
      # Usage: RubyKong::Plugin.list
      def list(*args)
        RubyKong::Request::Plugin.list args[0]
      end

      # Params: api: id,
      #         filter: {name, api_id, consumer_id, size, offset}
      #
      # Usage: RubyKong::Plugin.list_by_api api: 'shipit',
      #                                     filter: {name: 'key-auth'}
      def list_by_api(*args)
        RubyKong::Request::Plugin.list_by_api args[0]
      end

      # Params: id
      #
      # Usage: RubyKong::Plugin.retrieve id: '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed'
      def retrieve(*args)
        RubyKong::Request::Plugin.retrieve args[0]
      end

      #
      # Usage: RubyKong::Plugin.retrieve_enabled
      def retrieve_enabled(*args)
        RubyKong::Request::Plugin.retrieve_enabled args[0]
      end

      # Params: plugin_name
      #
      # Usage: RubyKong::Plugin.retrieve_schema plugin_name: 'basic_auth'
      def retrieve_schema(*args)
        RubyKong::Request::Plugin.retrieve_schema args[0]
      end

      # Params: api:, plugin:,
      #         params: {name:, consumer_id:, config.{property}}
      #
      # Usage: RubyKong::Plugin.update api: 'shipit',
      #                                plugin: '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed'
      #                                params: {name: 'basic-auth'}
      def update(*args)
        RubyKong::Request::Plugin.update args[0]
      end

      # Params: id, name
      #
      # Usage: RubyKong::Plugin.update name: 'shipit',
      #                             upstream_url: 'https://api.shipit.vn/v2/'
      def delete(*args)
        RubyKong::Request::Plugin.delete args[0]
      end
    end
  end
end
