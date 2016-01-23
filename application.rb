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
  wiki_host = "https://en.wikipedia.org/w/api.php"
  wiki_client = MediawikiApi::Client.new wiki_host
  random_page = wiki_client.query generator:'random', grnnamespace:0
  @title = random_page.data["pages"].first[1]['title']

  @image = Flickr.photos.get_interesting.sample
  
  quotes_api = ForismaticQuotesApi.new
  quote_response = JSON.parse quotes_api.get('', format: 'json', method: 'getQuote', lang: 'en').body
  @album_name = quote_response['quoteText'].strip.chomp('.').split(' ').last(5).join(' ')
  
  erb :root
end
