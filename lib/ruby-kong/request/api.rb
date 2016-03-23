module RubyKong
  module Request
    module Api
      class << self
        def create(*args)
          path = RubyKong.paths[:api][:create]
          Request.post(path, args[0])
        end

        def list(*args)
          path = RubyKong.paths[:api][:list]
          Request.get(path, args[0])
        end

        def retrieve(*args)
          resource = args[0][:name] || args[0][:id]
          path = RubyKong.paths[:api][:retrieve] + resource
          Request.get(path)
        end

        def update(*args)
          resource = args[0][:name] || args[0][:id]
          path = RubyKong.paths[:api][:update] + resource
          Request.patch(path, args[0])
        end

        def delete(*args)
          resource = args[0][:name] || args[0][:id]
          path = RubyKong.paths[:api][:update] + resource
          Request.delete(path, args[0])
        end
      end

      class Mock
        def self.delete
          # Mock with /apis/shipit path
          path = RubyKong.paths[:api][:retrieve] + 'shipit'
          url = RubyKong::Utils.endpoint_builder(path)
          stub_request(:delete, url)
            .to_return(
              :status => 204,
              :body   => ""
            )
        end

        def self.update
          # Mock with /apis/shipit path
          path = RubyKong.paths[:api][:retrieve] + 'shipit'
          url = RubyKong::Utils.endpoint_builder(path)
          stub_request(:patch, url)
            .with(
              :body => {
                :upstream_url => 'https://api.shipit.vn/v2/',
                :name         => 'shipit'
              }
            )
            .to_return(
              :status => 200,
              :body   => {
                'upstream_url' => 'https://api.shipit.vn/v2/',
                'id'           => '0faeb3a7-3839-4739-916a-6b139c5b491b',
                'name'         => 'shipit',
                'created_at'   => 1458706997000,
                'request_host' => 'api.shipit.vn'
              }.to_s
            )
        end

        def self.retrieve
          # Mock with /apis/shipit path
          path = RubyKong.paths[:api][:retrieve] + 'shipit'
          url = RubyKong::Utils.endpoint_builder(path)
          stub_request(:get, url)
            .to_return(
              :status => 200,
              :body   => {
                "upstream_url" => "https://api.shipit.vn/v1/",
                "id"           => "0faeb3a7-3839-4739-916a-6b139c5b491b",
                "name"         => "shipit",
                "created_at"   => 1458706997000,
                "request_host" => "api.shipit.vn"
              }.to_s
            )
        end

        def self.list
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:api][:list])
          stub_request(:get, url)
            .to_return(
              :status => 200,
              :body   => {
                "data"   =>
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
            )
        end

        def self.create
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:api][:create])
          stub_request(:post, url)
            .with(
              :body => {
                :upstream_url => 'https://api.shipit.vn/v1/',
                :request_host => 'api.shipit.vn',
                :name         => 'shipit'
              }
            )
            .to_return(
              :status => 201,
              :body   => {
                'upstream_url' => 'https://api.shipit.vn/v1/',
                'id'           => '0faeb3a7-3839-4739-916a-6b139c5b491b',
                'name'         => 'shipit',
                'created_at'   => 1458706997000,
                'request_host' => 'api.shipit.vn'
              }.to_s
            )
        end
      end
    end
  end
end
