require 'spec_helper'

describe RubyKong::Plugin do
  before(:each) do
    require 'webmock'
    include WebMock::API
    RubyKong.new(RubyKong.mockurl)
  end

  after(:each) do
    RubyKong::Stub.reopen_real_connection!
  end

  it 'add plugin to api (/apis/:api_id/plugins)' do
    # Mock with /apis/shipit/plugins path
    path = RubyKong.paths[:plugin][:create]
    path.gsub!(':api_id', 'shipit')
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :post,
      :url      => url,
      :request  => {
        :body => {
          :name => 'key-auth'
        }
      },
      :response => {
        :status => 201,
        :body   => {
          'api_id'     => 'ec60e4c9-11e2-4748-817d-56b2bf69bd60',
          'id'         => '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed',
          'created_at' => 1458809572000,
          'enabled'    => true,
          'name'       => 'key-auth',
          'config'     => {
            'key_names'        => ['apikey'],
            'hide_credentials' => false
          }
        }.to_s
      }
    )

    api = RubyKong::Plugin.create api: 'shipit',
                                  plugin: {name: 'key-auth'}
    expect(api.body).to include('key-auth')
    expect(api.code).to equal(201)
  end

  it 'list all plugins (/plugins)' do
    # Mock with /plugins path
    path = RubyKong.paths[:plugin][:list]
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          "data"  =>
          [
            {
              'api_id'     => 'ec60e4c9-11e2-4748-817d-56b2bf69bd60',
              'id'         => '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed',
              'created_at' => 1458809572000,
              'enabled'    => true,
              'name'       => 'key-auth',
              'config'     => {
                'key_names'        => ['apikey'],
                'hide_credentials' => false
              }
            }
          ],
          "total" => 1
        }.to_s
      }
    )

    api = RubyKong::Plugin.list
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'list by api (/apis/:api_id/plugins)' do
    # Mock with /apis/shipit/plugins path
    path = RubyKong.paths[:plugin][:list_by_api]
    path.gsub!(':api_id', 'shipit')
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          "data"  =>
          [
            {
              'api_id'     => 'ec60e4c9-11e2-4748-817d-56b2bf69bd60',
              'id'         => '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed',
              'created_at' => 1458809572000,
              'enabled'    => true,
              'name'       => 'key-auth',
              'config'     => {
                'key_names'        => ['apikey'],
                'hide_credentials' => false
              }
            }
          ],
          "total" => 1
        }.to_s
      }
    )

    api = RubyKong::Plugin.list_by_api api: "shipit"
    expect(api.body).to include('id')
    expect(api.code).to equal(200)
  end

  it 'retrieve an plugin by id (/plugins/:id)' do
    # Mock with /plugins/90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed path

    path = RubyKong.paths[:plugin][:retrieve]
    path.gsub!(':plugin_id', '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed')
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          'api_id'     => 'ec60e4c9-11e2-4748-817d-56b2bf69bd60',
          'id'         => '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed',
          'created_at' => 1458809572000,
          'enabled'    => true,
          'name'       => 'key-auth',
          'config'     => {
            'key_names'        => ['apikey'],
            'hide_credentials' => false
          }
        }.to_s
      }
    )

    api = RubyKong::Plugin.retrieve id: '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed'
    expect(api.body).to include('key-auth')
    expect(api.code).to equal(200)
  end

  it 'retrieve a list of all installed plugins (/plugins/enabled)' do
    # Mock with /plugins/enabled path
    path = RubyKong.paths[:plugin][:retrieve_enabled]
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          "enabled_plugins" => [
              "ssl",
              "jwt",
              "acl",
              "cors",
              "oauth2",
              "tcp-log",
              "udp-log",
              "file-log",
              "http-log",
              "key-auth",
              "hmac-auth",
              "basic-auth",
              "ip-restriction",
              "mashape-analytics",
              "request-transformer",
              "response-transformer",
              "request-size-limiting",
              "rate-limiting",
              "response-ratelimiting"
          ]
        }.to_s
      }
    )

    api = RubyKong::Plugin.retrieve_enabled
    expect(api.body).to include('key-auth')
    expect(api.code).to equal(200)
  end

  it "retrieve the schema of a plugin's configuration (/plugins/schema/:plugin_name)" do
    # Mock with /plugins/schema/basic-auth path
    path = RubyKong.paths[:plugin][:retrieve_schema]
    path.gsub!(':plugin_name', 'basic-auth')
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :get,
      :url      => url,
      :response => {
        :status => 200,
        :body   => {
          "fields" => {
            "hide_credentials" => {
              "type" => "boolean",
              "default" => false
            }
          },
          "no_consumer" => true
        }.to_s
      }
    )

    api = RubyKong::Plugin.retrieve_schema plugin_name: 'basic-auth'
    expect(api.code).to equal(200)
  end

  it 'update a plugin (/apis/:api_id/plugins/:plugin_id)' do
    # Mock with /apis/shipit/plugins/90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed path

    path      = RubyKong.paths[:plugin][:update]
    path.gsub!(':api_id', 'shipit')
    path.gsub!(':plugin_id', '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed')
    url = RubyKong::Utils.endpoint_builder(path)

    RubyKong::Stub.request(
      :method   => :patch,
      :url      => url,
      :request  => {
        :body => {}
      },
      :response => {
        :status => 200,
        :body   => {
          'api_id'     => 'ec60e4c9-11e2-4748-817d-56b2bf69bd60',
          'id'         => '90e6e8f4-2d51-444d-ac28-3f1dc1b3b3ed',
          'created_at' => 1458809572000,
          'enabled'    => true,
          'name'       => 'key-auth',
          'config'     => {
            'key_names'        => ['apikey'],
            'hide_credentials' => false
          }
        }.to_s
      }
    )

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
