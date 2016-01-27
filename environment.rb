require 'rubygems'
require 'bundler/setup'
require 'dotenv'
require 'ostruct'
require 'flickr-objects'

require 'sinatra' unless defined?(Sinatra)

Dotenv.load *%w[.env.local .env.#{ENV['RACK_ENV']}]

Flickr.configure do |config|
  config.api_key       = ENV['FLICKR_API_KEY']
  config.shared_secret = ENV['FLICKR_SECRET']
end

configure do
  SiteConfig = OpenStruct.new(
                 :title => 'Hipster Album Cover',
                 :author => 'Cable Ray',
                 :url_base => 'http://localhost:4567/'
               )

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end
