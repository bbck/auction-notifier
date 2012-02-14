require 'sinatra'
require 'rack/test'
require 'data_mapper'

require File.join(File.dirname(__FILE__), '..', 'auction_notifier.rb')

# setup test environment
set :environment, :test
set :run, false
set :raise_errors, true
set :logging, false
set :views => File.join(File.dirname(__FILE__), "..", "views")

DataMapper.setup(:default, "sqlite::memory:")

def app
  Sinatra::Application
end

RSpec.configure do |config|
  config.include Rack::Test::Methods

  config.before(:each) { DataMapper.auto_migrate! }
end
