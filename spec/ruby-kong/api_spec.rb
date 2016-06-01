require 'spec_helper'

describe RubyKong::Api do
  before(:each) do
    require 'webmock'
    include WebMock::API
    RubyKong.new(RubyKong.mockurl)
  end

  after(:each) do
    RubyKong::Stub.reopen_real_connection!
  end

  it 'create new api (/apis)' do
    # Mock with /apis path
    url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:api][:create])
    RubyKong::Stub.request(
      :method   => :post,
      :url      => url,
      :request  => {
        :body => {
          :upstream_url => 'https://api.shipit.vn/v1/',
          :request_host => 'api.shipit.vn',
          :name         => 'shipit'
        }
      },
      :response => {
        :status => 201,
        :body   => {
          'upstream_url' => 'https://api.shipit.vn/v1/',
          'id'           => '0faeb3a7-3839-4739-916a-6b139c5b491b',
          'name'         => 'shipit',
          'created_at'   => 1458706997000,
          'request_host' => 'api.shipit.vn'
        }.to_s
      }
    )

    api = RubyKong::Api.create upstream_url: 'https://api.shipit.vn/v1/',
                               request_host: 'api.shipit.vn',
                               name: 'shipit'
    expect(api.body).to include('shipit.vn')
    expect(api.code).to equal(201)
  end

  it 'list all apis (/apis)' do
    # Mock with /apis path
    url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:api][:list])

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          "data"  =>
          [
            {
              "upstream_url" => "https://api.shipit.vn/v1/",
              "id"           => "0faeb3a7-3839-4739-916a-6b139c5b491b",
              "name"         => "shipit",
              "created_at"   => 1458706997000,
              "request_host" => "api.shipit.vn"
            }
          ],
          "total" => 1
        }.to_s
      }
    )

    api = RubyKong::Api.list
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'retrieve an api by name (/apis/:name)' do
    # Mock with /apis/shipit path
    path = RubyKong.paths[:api][:retrieve] + 'shipit'
    url  = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          "upstream_url" => "https://api.shipit.vn/v1/",
          "id"           => "0faeb3a7-3839-4739-916a-6b139c5b491b",
          "name"         => "shipit",
          "created_at"   => 1458706997000,
          "request_host" => "api.shipit.vn"
        }.to_s
      }
    )

    api = RubyKong::Api.retrieve name: 'shipit'
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'update an api by name (/apis/:name)' do
    # Mock with /apis/shipit path
    path = RubyKong.paths[:api][:update] + 'shipit'
    url  = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :patch,
      :url      => url,
      :request  => {
        :body => {
          :upstream_url => 'https://api.shipit.vn/v2/',
          :name         => 'shipit'
        }
      },
      :response => {
        :status => 200,
        :body   => {
          'upstream_url' => 'https://api.shipit.vn/v2/',
          'id'           => '0faeb3a7-3839-4739-916a-6b139c5b491b',
          'name'         => 'shipit',
          'created_at'   => 1458706997000,
          'request_host' => 'api.shipit.vn'
        }.to_s
      }
    )

    api = RubyKong::Api.update upstream_url: 'https://api.shipit.vn/v2/',
                               name: 'shipit'
    expect(api.body).to include('v2')
    expect(api.code).to equal(200)
  end

  it 'delete an api by name (/apis/:id)' do
    # Mock with /apis/shipit path
    path = RubyKong.paths[:api][:delete] + 'shipit'
    url  = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :delete,
      :url      => url,
      :response => {
        :status => 204,
        :body   => ""
      }
    )

    api = RubyKong::Api.delete name: 'shipit'
    expect(api.code).to equal(204)
  end
end
