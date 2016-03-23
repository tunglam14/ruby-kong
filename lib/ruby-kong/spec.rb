module RubyKong
  class << self
    attr_accessor :url

    def paths
      {
        :node => {
          :info   => '/',
          :status => '/status'
        },
        :api  => {
          :create   => '/apis',
          :list     => '/apis',
          :retrieve => '/apis/',
          :update   => '/apis/',
          :delete   => '/apis/'
        }
      }
    end

    def mockurl
      @mockurl = 'http://mockdomain:8001'
    end
  end
end
