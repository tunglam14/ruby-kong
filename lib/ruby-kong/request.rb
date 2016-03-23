require 'unirest'
module RubyKong
  module Request
    class << self
      def get(path, params = nil, headers = {})
        endpoint = RubyKong::Utils.endpoint_builder(path)
        Unirest.get(endpoint, :headers => headers, :parameters => params)
      end

      def post(path, params = nil, headers = {})
        endpoint = RubyKong::Utils.endpoint_builder(path)
        Unirest.post(endpoint, :headers => headers, :parameters => params)
      end

      def put(path, params = nil, headers = {})
        endpoint = RubyKong::Utils.endpoint_builder(path)
        Unirest.put(endpoint, :headers => headers, :parameters => params)
      end

      def patch(path, params = nil, headers = {})
        endpoint = RubyKong::Utils.endpoint_builder(path)
        Unirest.patch(endpoint, :headers => headers, :parameters => params)
      end

      def delete(path, params = nil, headers = {})
        endpoint = RubyKong::Utils.endpoint_builder(path)
        Unirest.delete(endpoint, :headers => headers, :parameters => params)
      end
    end
  end
end
