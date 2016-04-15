module RubyKong
  module Request
    module Plugin
      class << self
        def create(*args)
          path = RubyKong.paths[:plugin][:create]
          path.gsub!(':api_id', args[0][:api])
          Request.post(path, args[0][:plugin])
        end

        def list(*args)
          path = RubyKong.paths[:plugin][:list]
          Request.get(path, args[0])
        end

        def list_by_api(*args)
          path = RubyKong.paths[:plugin][:list_by_api]
          path.gsub!(':api_id', args[0][:api])
          Request.get(path, args[0][:filter])
        end

        def retrieve(*args)
          plugin_id = args[0][:id]
          path      = RubyKong.paths[:plugin][:retrieve]
          path.gsub!(':plugin_id', plugin_id)
          Request.get(path)
        end

        def retrieve_enabled(*args)
          path      = RubyKong.paths[:plugin][:retrieve_enabled]
          Request.get(path)
        end

        def retrieve_schema(*args)
          plugin_name = args[0][:plugin_name]
          path        = RubyKong.paths[:plugin][:retrieve_schema]
          path.gsub!(':plugin_name', plugin_name)
          Request.get(path)
        end

        def update(*args)
          api_id    = args[0][:api]
          plugin_id = args[0][:plugin]
          path      = RubyKong.paths[:plugin][:update]
          path.gsub!(':api_id', api_id)
          path.gsub!(':plugin_id', plugin_id)

          Request.patch(path, args[0][:params])
        end

        def delete(*args)
          resource = args[0][:username] || args[0][:id]
          path     = RubyKong.paths[:plugin][:update] + resource
          Request.delete(path, args[0])
        end
      end

      class Stub
        # def self.delete
        #   # Mock with /plugins/lamdt path
        #   path = RubyKong.paths[:plugin][:delete] + 'lamdt'
        #   url  = RubyKong::Utils.endpoint_builder(path)
        #
        #   RubyKong::Stub.request(
        #     :method   => :delete,
        #     :url      => url,
        #     :response => {
        #       :status => 204,
        #       :body   => ""
        #     }
        #   )
        # end
        #
        def self.update
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
        end

        def self.retrieve
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
        end

        def self.retrieve_enabled
          path = RubyKong.paths[:plugin][:retrieve_enabled]
          url = RubyKong::Utils.endpoint_builder(path)

          RubyKong::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :status => 200,
              :body   => {
                "enabled_plugins": [
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
        end

        def self.retrieve_schema
          path = RubyKong.paths[:plugin][:retrieve_schema]
          path.gsub!(':plugin_name', 'basic-auth')
          url = RubyKong::Utils.endpoint_builder(path)

          RubyKong::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :status => 200,
              :body   => {
                "fields": {
                  "hide_credentials": {
                    "type":"boolean",
                    "default":false
                  }
                },
                "no_consumer":true
              }.to_s
            }
          )
        end

        def self.list
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
        end

        def self.list_by_api
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
        end

        def self.create
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
        end # End of Stub.create method
      end # End of Stub module
    end # end of Consumer
  end # End of Request
end # End of RubyKong
