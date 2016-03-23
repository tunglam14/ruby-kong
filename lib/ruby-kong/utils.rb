module RubyKong
  module Utils
    class << self
      def endpoint_builder(path)
        RubyKong.url + path
      end
    end
  end
end
