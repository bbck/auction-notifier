require 'sinatra'
require 'rack/test'

require File.join(File.dirname(__FILE__), '..', 'auction_notifier.rb')

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods
end
