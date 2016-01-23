require "rubygems"
require "bundler/setup"
require "sinatra"
require "mediawiki_api"
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
  erb :root
end
