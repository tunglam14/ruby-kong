module RubyKong
  module Stub
    class << self
      def request(method:, url:, request: {}, response: {})
        if request.empty?
          stub_request(method, url)
            .to_return(response)
        else
          stub_request(method, url)
            .with(request)
            .to_return(response)
        end
      end # End of def requets

      def reopen_real_connection!
        WebMock.allow_net_connect!
      end

      def enable!
        WebMock.enable!
      end

      def disable
        WebMock.disable!
      end
    end # End of class self
  end # End of Stub module
end # End of RubyKong module
