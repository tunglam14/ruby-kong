module RubyKong
  class << self
    attr_accessor :url

    def paths
      {
        :node     => {
          :info   => '/',
          :status => '/status'
        },
        :api      => {
          :create   => '/apis',
          :list     => '/apis',
          :retrieve => '/apis/',
          :update   => '/apis/',
          :delete   => '/apis/'
        },
        :consumer => {
          :create   => '/consumers',
          :list     => '/consumers',
          :retrieve => '/consumers/',
          :update   => '/consumers/',
          :delete   => '/consumers/'
        }
      }
    end

    def mockurl
      @mockurl = 'http://mockdomain:8001'
    end
  end
end
