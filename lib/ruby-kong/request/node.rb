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
     end # end of Node
  end # End of Request
end # End of RubyKong