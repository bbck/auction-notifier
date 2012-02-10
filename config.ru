require 'rubygems'
require 'bundler'

Bundler.require

require './auction_notifier'

run Sinatra::Application
