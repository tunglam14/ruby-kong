require 'spec_helper'

describe RubyKong::Api do
  before(:each) do
    RubyKong.new(RubyKong.mockurl)

    RubyKong::Request::Api::Mock.create
    RubyKong::Request::Api::Mock.list
    RubyKong::Request::Api::Mock.retrieve
    RubyKong::Request::Api::Mock.update
    RubyKong::Request::Api::Mock.delete
  end

  it 'create new api ok (/apis)' do
    api = RubyKong::Api.create upstream_url: 'https://api.shipit.vn/v1/',
                                request_host: 'api.shipit.vn',
                                name: 'shipit'

    expect(api.body).to include('shipit.vn')
    expect(api.code).to equal(201)
  end

  it 'list all apis (/apis)' do
    api = RubyKong::Api.list

    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'retrieve an api (/apis/:id)' do
    api = RubyKong::Api.retrieve name: 'shipit'

    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'update an api ok (/apis/:id)' do
    api = RubyKong::Api.update upstream_url: 'https://api.shipit.vn/v2/',
                               name: 'shipit'

    expect(api.body).to include('v2')
    expect(api.code).to equal(200)
  end

  it 'delete an api ok (/apis/:id)' do
    api = RubyKong::Api.delete name: 'shipit'

    expect(api.code).to equal(204)
  end
end
