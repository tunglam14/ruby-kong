require 'ruby-kong/request/node'

module RubyKong
  module Node
    class << self
      def info
        RubyKong::Request::Node.get_node_info
      end

      def status
        RubyKong::Request::Node.get_node_status
      end
    end
  end
end
