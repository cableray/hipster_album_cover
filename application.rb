require "rubygems"
require "bundler/setup"
require "sinatra"
require "mediawiki_api"
require "json"
require File.join(File.dirname(__FILE__), "environment")

configure do
  set :views, "#{File.dirname(__FILE__)}/views"
  set :show_exceptions, :after_handler
end

configure :production, :development do
  enable :logging
end

helpers do
  # add your helpers here
end

# root page
get "/" do
  @band_name = BandName.get_random

  quotes_api = ForismaticQuotesApi.new
  quote_response = JSON.parse quotes_api.get('', format: 'json', method: 'getQuote', lang: 'en').body
  @album_title = quote_response['quoteText'].strip.chomp('.').split(' ').last(5).join(' ')

  @image = Flickr.photos.get_interesting.sample

  @title ="Now playing: #@album_title by #@band_name"
  
  erb :root
end
