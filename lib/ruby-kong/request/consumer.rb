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
          path     = RubyKong.paths[:consumer][:retrieve] + resource
          Request.get(path)
        end

        def update(*args)
          resource = args[0][:username] || args[0][:id]
          path     = RubyKong.paths[:consumer][:update] + resource
          Request.patch(path, args[0])
        end

        def delete(*args)
          resource = args[0][:username] || args[0][:id]
          path     = RubyKong.paths[:consumer][:update] + resource
          Request.delete(path, args[0])
        end
      end

      class Stub
        def self.delete
          # Mock with /consumers/lamdt path
          path = RubyKong.paths[:consumer][:delete] + 'lamdt'
          url  = RubyKong::Utils.endpoint_builder(path)

          RubyKong::Stub.request(
            :method   => :delete,
            :url      => url,
            :response => {
              :status => 204,
              :body   => ""
            }
          )
        end

        def self.update
          # Mock with /consumers/lamdt path
          path = RubyKong.paths[:consumer][:update] + 'lamdt'
          url = RubyKong::Utils.endpoint_builder(path)

          RubyKong::Stub.request(
            :method   => :patch,
            :url      => url,
            :request  => {
              :body => {
                :custom_id => '1234',
                :username  => 'lamdt'
              }
            },
            :response => {
              :status => 200,
              :body   => {
                'custom_id'  => 1234,
                'username'   => 'lamdt',
                'created_at' => 1458789832000,
                'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
              }.to_s
            }
          )
        end

        def self.retrieve
          # Mock with /consumers/lamdt path
          path = RubyKong.paths[:consumer][:retrieve] + 'lamdt'
          url = RubyKong::Utils.endpoint_builder(path)

          RubyKong::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :status => 200,
              :body   => {
                'username'   => 'lamdt',
                'created_at' => 1458789832000,
                'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
              }.to_s
            }
          )
        end

        def self.list
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:consumer][:list])

          RubyKong::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
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
            }
          )
        end

        def self.create
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:consumer][:create])

          RubyKong::Stub.request(
            :method   => :post,
            :url      => url,
            :request  => {
              :body => {
                :username => 'lamdt'
              }
            },
            :response => {
              :status => 201,
              :body   => {
                'username'   => 'lamdt',
                'created_at' => 1458789832000,
                'id'         => 'b880f403-b161-4294-9a13-2462d39991b2'
              }.to_s
            }
          )
        end # End of Stub.create method
      end # End of Stub module
    end # end of Consumer
  end # End of Request
end # End of RubyKong
