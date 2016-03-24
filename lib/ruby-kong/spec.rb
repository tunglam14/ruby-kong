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
        },
        :plugin   => {
          :create           => '/apis/:api_id/plugins',
          :list             => '/plugins',
          :list_by_api      => '/apis/:api_id/plugins',
          :retrieve         => '/plugins/:plugin_id',
          :retrieve_enabled => '/plugins/enabled',
          :retrieve_schema  => '/plugins/schema/:plugin_name',
          :update           => '/apis/:api_id/plugins/:plugin_id',
          :delete           => '/apis/:api_id/plugins/:plugin_id'
        }
      }
    end

    def mockurl
      @mockurl = 'http://mockdomain:8001'
    end
  end
end
