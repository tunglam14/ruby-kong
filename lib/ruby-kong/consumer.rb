require 'ruby-kong/request/consumer'

module RubyKong
  module Consumer
    class << self
      # Params: username, custom_id
      #
      # Usage: RubyKong::Consumer.create username: 'lamdt'
      def create(*args)
        RubyKong::Request::Consumer.create args[0]
      end

      # Params: id, username, custom_id, size, offset
      #
      # Usage: RubyKong::Consumer.list
      def list(*args)
        RubyKong::Request::Consumer.list args[0]
      end

      # Params: id, username
      #
      # Usage: RubyKong::Consumer.retrieve username: 'lamdt'
      def retrieve(*args)
        RubyKong::Request::Consumer.retrieve args[0]
      end

      # Params: custom_id, username
      #
      # Usage: RubyKong::Consumer.update username: 'lamdt',
      #                                  custom_id: 123
      def update(*args)
        RubyKong::Request::Consumer.update args[0]
      end

      # Params: id, username
      #
      # Usage: RubyKong::Consumer.delete username: 'lamdt'
      def delete(*args)
        RubyKong::Request::Consumer.delete args[0]
      end
    end
  end
end
