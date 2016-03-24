module RubyKong
  module Request
    module Node
      class << self
        def get_node_info
          path = RubyKong.paths[:node][:info]

          Request.get path
        end

        def get_node_status
          path = RubyKong.paths[:node][:status]

          Request.get path
        end
      end

      class Stub
        def self.get_node_info
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:node][:info])

          RubyKong::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :body => {
                'version'     => '0.7.0',
                'lua_version' => 'LuaJIT 2.1.0-beta1',
                'tagline'     => 'Welcome to Kong',
                'hostname'    => '8b173da56e6'
              }.to_s
            }
          )
        end

        def self.get_node_status
          url = RubyKong::Utils.endpoint_builder(RubyKong.paths[:node][:status])

          RubyKong::Stub.request(
            :method   => :get,
            :url      => url,
            :response => {
              :body => {
                "server"   => {
                  "connections_handled"  => 2757,
                  "connections_reading"  => 0,
                  "connections_active"   => 1,
                  "connections_waiting"  => 0,
                  "connections_writing"  => 1,
                  "total_requests"       => 2757,
                  "connections_accepted" => 2757
                },
                "database" => {
                  "response_ratelimiting_metrics" => 0,
                  "keyauth_credentials"           => 0,
                  "apis"                          => 0,
                  "consumers"                     => 0,
                  "plugins"                       => 0,
                  "nodes"                         => 1,
                  "basicauth_credentials"         => 0,
                  "ratelimiting_metrics"          => 0
                }
              }.to_s
            }
          )
        end
      end
    end
  end
end
