require 'spec_helper'

describe RubyKong::Consumer do
  before(:each) do
    require 'webmock'
    include WebMock::API
    RubyKong.new(RubyKong.mockurl)
  end

  after(:each) do
    RubyKong::Stub.reopen_real_connection!
  end

  it 'create new consumer with username (/consumers)' do
    # Mock with /consumers path
    url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:consumer][:create])

    RubyKong::Stub.request(
      :method   => :post,
      :url      => url,
      :request  => {
        :body => {
          :username => 'lamdt'
        }
      },
      :response => {
        :status => 201,
        :body   => {
          'username'   => 'lamdt',
          'created_at' => 1458789832000,
          'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
        }.to_s
      }
    )

    consumer = RubyKong::Consumer.create username: 'lamdt'
    expect(consumer.body).to include('lamdt')
    expect(consumer.code).to equal(201)
  end

  it 'list all consumers (/consumers)' do
    # Mock with /consumers path
    url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:consumer][:list])

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          "data"  =>
          [
            {
              'username'   => 'lamdt',
              'created_at' => 1458789832000,
              'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
            }
          ],
          "total" => 1
        }.to_s
      }
    )

    consumer = RubyKong::Consumer.list
    expect(consumer.body).to include('username')
    expect(consumer.code).to equal(200)
  end

  it 'retrieve a consumer by username (/consumers/:username)' do
    # Mock with /consumers/lamdt path
    path = RubyKong.paths[:consumer][:retrieve] + 'lamdt'
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          'username'   => 'lamdt',
          'created_at' => 1458789832000,
          'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
        }.to_s
      }
    )

    consumer = RubyKong::Consumer.retrieve username: 'lamdt'
    expect(consumer.body).to include('id')
    expect(consumer.code).to equal(200)
  end

  it 'update custom_id of a consumer by username (/consumers/:username)' do
    # Mock with /consumers/lamdt path
    path = RubyKong.paths[:consumer][:update] + 'lamdt'
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :patch,
      :url      => url,
      :request  => {
        :body => {
          :custom_id => '1234',
          :username  => 'lamdt'
        }
      },
      :response => {
        :status => 200,
        :body   => {
          'custom_id'  => 1234,
          'username'   => 'lamdt',
          'created_at' => 1458789832000,
          'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
        }.to_s
      }
    )

    consumer = RubyKong::Consumer.update username: 'lamdt',
                                         custom_id: '1234'
    expect(consumer.body).to include('1234')
    expect(consumer.code).to equal(200)
  end

  it 'delete a consumer by name (/consumers/:username)' do
    # Mock with /consumers/lamdt path
    path = RubyKong.paths[:consumer][:delete] + 'lamdt'
    url  = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :delete,
      :url      => url,
      :response => {
        :status => 204,
        :body   => ""
      }
    )

    consumer = RubyKong::Consumer.delete username: 'lamdt'
    expect(consumer.code).to equal(204)
  end
end
