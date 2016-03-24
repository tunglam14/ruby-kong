require 'spec_helper'

describe RubyKong::Api do
  before(:all) do
    RubyKong.new(RubyKong.mockurl)
  end

  it 'create new api (/apis)' do
    RubyKong::Request::Api::Stub.create

    api = RubyKong::Api.create upstream_url: 'https://api.shipit.vn/v1/',
                               request_host: 'api.shipit.vn',
                               name: 'shipit'
    expect(api.body).to include('shipit.vn')
    expect(api.code).to equal(201)
  end

  it 'list all apis (/apis)' do
    RubyKong::Request::Api::Stub.list

    api = RubyKong::Api.list
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'retrieve an api by name (/apis/:name)' do
    RubyKong::Request::Api::Stub.retrieve

    api = RubyKong::Api.retrieve name: 'shipit'
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'update an api by name (/apis/:name)' do
    RubyKong::Request::Api::Stub.update

    api = RubyKong::Api.update upstream_url: 'https://api.shipit.vn/v2/',
                               name: 'shipit'
    expect(api.body).to include('v2')
    expect(api.code).to equal(200)
  end

  it 'delete an api by name (/apis/:id)' do

    RubyKong::Request::Api::Stub.delete

    api = RubyKong::Api.delete name: 'shipit'
    expect(api.code).to equal(204)
  end
end
