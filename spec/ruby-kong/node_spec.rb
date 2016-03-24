require 'spec_helper'

describe RubyKong::Node do
  before(:all) do
    RubyKong.new(RubyKong.mockurl)
  end

  it 'should have generic infomation (/)' do
    RubyKong::Request::Node::Stub.get_node_info

    node_info = RubyKong::Node.info
    expect(node_info.body).to include('version')
    expect(node_info.code).to equal(200)
  end

  it 'should have usage information about this node (/status)' do
    RubyKong::Request::Node::Stub.get_node_status

    node_status = RubyKong::Node.status
    expect(node_status.body).to include('total_requests')
    expect(node_status.code).to equal(200)
  end
end
