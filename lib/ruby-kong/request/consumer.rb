module RubyKong
  module Request
    module Consumer
      class << self
        def create(*args)
          path = RubyKong.paths[:consumer][:create]
          Request.post(path, args[0])
        end

        def list(*args)
          path = RubyKong.paths[:consumer][:list]
          Request.get(path, args[0])
        end

        def retrieve(*args)
          resource = args[0][:username] || args[0][:id]
          path = RubyKong.paths[:consumer][:retrieve] + resource
          Request.get(path)
        end

        def update(*args)
          resource = args[0][:username] || args[0][:id]
          path = RubyKong.paths[:consumer][:update] + resource
          Request.patch(path, args[0])
        end

        def delete(*args)
          resource = args[0][:username] || args[0][:id]
          path = RubyKong.paths[:consumer][:update] + resource
          Request.delete(path, args[0])
        end
      end

      class Mock
        def self.delete
          # Mock with /consumers/lamdt path
          path = RubyKong.paths[:consumer][:retrieve] + 'lamdt'
          url = RubyKong::Utils.endpoint_builder(path)
          stub_request(:delete, url)
            .to_return(
              :status => 204,
              :body   => ""
            )
        end

        def self.update
          # Mock with /consumers/lamdt path
          path = RubyKong.paths[:consumer][:update] + 'lamdt'
          url = RubyKong::Utils.endpoint_builder(path)
          stub_request(:patch, url)
            .with(
              :body => {
                :custom_id => '1234',
                :username  => 'lamdt'
              }
            )
            .to_return(
              :status => 200,
              :body   => {
                'custom_id'  => 1234,
                'username'   => 'lamdt',
                'created_at' => 1458789832000,
                'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
              }.to_s
            )
        end

        def self.retrieve
          # Mock with /consumers/lamdt path
          path = RubyKong.paths[:consumer][:retrieve] + 'lamdt'
          url = RubyKong::Utils.endpoint_builder(path)
          stub_request(:get, url)
            .to_return(
              :status => 200,
              :body   => {
                'username'   => 'lamdt',
                'created_at' => 1458789832000,
                'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
              }.to_s
            )
        end

        def self.list
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:consumer][:list])
          stub_request(:get, url)
            .to_return(
              :status => 200,
              :body   => {
                "data"   =>
                  [
                    {
                      'username'   => 'lamdt',
                      'created_at' => 1458789832000,
                      'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
                    }
                  ],
                 "total" => 1
              }.to_s
            )
        end

        def self.create
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:consumer][:create])
          stub_request(:post, url)
            .with(
              :body => {
                :username => 'lamdt'
              }
            )
            .to_return(
              :status => 201,
              :body   => {
                'username'   => 'lamdt',
                'created_at' => 1458789832000,
                'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
              }.to_s
            )
        end
      end
    end
  end
end
