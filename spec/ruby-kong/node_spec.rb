require 'spec_helper'

describe RubyKong::Node do
  before(:each) do
    require 'webmock'
    include WebMock::API
    RubyKong.new(RubyKong.mockurl)
  end

  after(:each) do
    RubyKong::Stub.reopen_real_connection!
  end

  it 'should have generic infomation (/)' do
    # Mock with / path
    url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:node][:info])

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :body => {
          'version'     => '0.7.0',
          'lua_version' => 'LuaJIT 2.1.0-beta1',
          'tagline'     => 'Welcome to Kong',
          'hostname'    => '8b173da56e6'
        }.to_s
      }
    )

    node_info = RubyKong::Node.info
    expect(node_info.body).to include('version')
    expect(node_info.code).to equal(200)
  end

  it 'should have usage information about this node (/status)' do
    # Mock with /status path
    url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:node][:status])

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :body => {
          "server"   => {
            "connections_handled"  => 2757,
            "connections_reading"  => 0,
            "connections_active"   => 1,
            "connections_waiting"  => 0,
            "connections_writing"  => 1,
            "total_requests"       => 2757,
            "connections_accepted" => 2757
          },
          "database" => {
            "response_ratelimiting_metrics" => 0,
            "keyauth_credentials"           => 0,
            "apis"                          => 0,
            "consumers"                     => 0,
            "plugins"                       => 0,
            "nodes"                         => 1,
            "basicauth_credentials"         => 0,
            "ratelimiting_metrics"          => 0
          }
        }.to_s
      }
    )

    node_status = RubyKong::Node.status
    expect(node_status.body).to include('total_requests')
    expect(node_status.code).to equal(200)
  end
end
