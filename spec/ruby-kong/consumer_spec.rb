require 'spec_helper'

describe RubyKong::Consumer do
  before(:each) do
    RubyKong.new(RubyKong.mockurl)

    RubyKong::Request::Consumer::Mock.create
    RubyKong::Request::Consumer::Mock.list
    RubyKong::Request::Consumer::Mock.retrieve
    RubyKong::Request::Consumer::Mock.update
    RubyKong::Request::Consumer::Mock.delete
  end

  it 'create new consumer with username (/consumers)' do
    consumer = RubyKong::Consumer.create username: 'lamdt'

    expect(consumer.body).to include('lamdt')
    expect(consumer.code).to equal(201)
  end

  it 'list all consumers (/consumers)' do
    consumer = RubyKong::Consumer.list

    expect(consumer.body).to include('username')
    expect(consumer.code).to equal(200)
  end

  it 'retrieve a consumer by username (/consumers/:username)' do
    consumer = RubyKong::Consumer.retrieve username: 'lamdt'

    expect(consumer.body).to include('id')
    expect(consumer.code).to equal(200)
  end

  it 'update custom_id of a consumer by username (/consumers/:username)' do
    consumer = RubyKong::Consumer.update username: 'lamdt',
                                         custom_id: '1234'

    expect(consumer.body).to include('1234')
    expect(consumer.code).to equal(200)
  end

  it 'delete a consumer by name (/consumers/:username)' do
    consumer = RubyKong::Consumer.delete username: 'lamdt'

    expect(consumer.code).to equal(204)
  end
end
