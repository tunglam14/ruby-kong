module RubyKong
  module Mock
    # class << self
    #   def start!
    #     require 'webmock'
    #     include WebMock::API
    #     WebMock.disable_net_connect!
    #
    #     eval('RubyKong::Request::Node::Mock.get_node_info')
    #   end
    #
    #   def stop!
    #     WebMock.allow_net_connect!
    #   end
    # end
  end
end
