require 'spec_helper'

describe RubyKong::Plugin do
  before(:all) do
    RubyKong.new(RubyKong.mockurl)
  end

  it 'add plugin to api (/apis/:api_id/plugins)' do
   RubyKong::Request::Plugin::Stub.create

    api = RubyKong::Plugin.create api: 'shipit',
                                  plugin: {name: 'key-auth'}
    expect(api.body).to include('key-auth')
    expect(api.code).to equal(201)
  end

  it 'list all plugins (/plugins)' do
    RubyKong::Request::Plugin::Stub.list

    api = RubyKong::Plugin.list
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'list all plugins in api (/api/:api_id/plugins)' do
    RubyKong::Request::Plugin::Stub.list_by_api

    api = RubyKong::Plugin.list_by_api api: 'shipit'
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'retrieve an plugin by id (/plugins/:id)' do
    RubyKong::Request::Plugin::Stub.retrieve

    api = RubyKong::Plugin.retrieve id: '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed'
    expect(api.body).to include('key-auth')
    expect(api.code).to equal(200)
  end

  it 'update a plugin (/apis/:api_id/plugins/:plugin_id)' do
    RubyKong::Request::Plugin::Stub.update

    api = RubyKong::Plugin.update api: 'shipit',
                                  plugin: '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed',
                                  params: {}

    expect(api.body).to include('90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed')
    expect(api.code).to equal(200)
  end

  # it 'delete an api by name (/apis/:id)' do
  #
  #   RubyKong::Request::Plugin::Stub.delete
  #
  #   api = RubyKong::Plugin.delete name: 'shipit'
  #   expect(api.code).to equal(204)
  # end
end
