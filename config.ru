require 'rubygems'
require 'bundler'

Bundler.require

require './auction_notifier'

DataMapper.setup(:default, ENV['HEROKU_SHARED_POSTGRESQL_PINK_URL'] || "sqlite3://#{Dir.pwd}/db/development.db")

run Sinatra::Application
