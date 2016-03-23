require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'webmock/rspec'

$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)
require 'ruby-kong'
include WebMock::API

WebMock.allow_net_connect!
