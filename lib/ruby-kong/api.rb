require 'ruby-kong/request/api'

module RubyKong
  module Api
    class << self
      # Params: upstream_url:, request_host: nil, request_path: nil, name: nil,
      # preserve_host: false, strip_request_path: false
      #
      # Usage: RubyKong::Api.create upstream_url: 'https://api.shipit.vn/v1/',
      #                             request_host: 'api.shipit.vn',
      #                             name: 'shipit'
      def create(*args)
        RubyKong::Request::Api.create args[0]
      end

      # Params: id, name, request_host, request_path, upstream_url, size, offset
      #
      # Usage: RubyKong::Api.list
      def list(*args)
        RubyKong::Request::Api.list args[0]
      end

      # Params: id, name
      #
      # Usage: RubyKong::Api.retrieve name: 'shipit'
      def retrieve(*args)
        RubyKong::Request::Api.retrieve args[0]
      end

      # Params: id, name
      #
      # Usage: RubyKong::Api.update name: 'shipit',
      #                             upstream_url: 'https://api.shipit.vn/v2/'
      def update(*args)
        RubyKong::Request::Api.update args[0]
      end

      # Params: id, name
      #
      # Usage: RubyKong::Api.update name: 'shipit',
      #                             upstream_url: 'https://api.shipit.vn/v2/'
      def delete(*args)
        RubyKong::Request::Api.delete args[0]
      end
    end
  end
end
