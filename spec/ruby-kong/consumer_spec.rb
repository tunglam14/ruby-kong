require 'spec_helper'

describe RubyKong::Consumer do
  before(:all) do
    RubyKong.new(RubyKong.mockurl)
  end

  it 'create new consumer with username (/consumers)' do
    RubyKong::Request::Consumer::Stub.create

    consumer = RubyKong::Consumer.create username: 'lamdt'
    expect(consumer.body).to include('lamdt')
    expect(consumer.code).to equal(201)
  end

  it 'list all consumers (/consumers)' do
    RubyKong::Request::Consumer::Stub.list

    consumer = RubyKong::Consumer.list
    expect(consumer.body).to include('username')
    expect(consumer.code).to equal(200)
  end

  it 'retrieve a consumer by username (/consumers/:username)' do
    RubyKong::Request::Consumer::Stub.retrieve

    consumer = RubyKong::Consumer.retrieve username: 'lamdt'
    expect(consumer.body).to include('id')
    expect(consumer.code).to equal(200)
  end

  it 'update custom_id of a consumer by username (/consumers/:username)' do
    RubyKong::Request::Consumer::Stub.update

    consumer = RubyKong::Consumer.update username: 'lamdt',
                                         custom_id: '1234'
    expect(consumer.body).to include('1234')
    expect(consumer.code).to equal(200)
  end

  it 'delete a consumer by name (/consumers/:username)' do
    RubyKong::Request::Consumer::Stub.delete

    consumer = RubyKong::Consumer.delete username: 'lamdt'
    expect(consumer.code).to equal(204)
  end
end
