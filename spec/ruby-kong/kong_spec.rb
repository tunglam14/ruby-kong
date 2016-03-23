require 'spec_helper'

describe RubyKong do
  it 'has a version number' do
    expect(RubyKong::VERSION).not_to be nil
  end

  it 'endpoint_builder work fine' do
    test_url = RubyKong.url + '/test'
    expect(RubyKong::Utils.endpoint_builder('/test')).not_to be test_url
  end
end
