class BandName < DelegateClass(String)
	def self.get_random
    wiki_host = "https://en.wikipedia.org/w/api.php"
    wiki_client = MediawikiApi::Client.new wiki_host
    random_page = wiki_client.query generator:'random', grnnamespace:0
    new(random_page.data['pages'].values.first['title'])
  end
 
	def initialize(args)
		super
	end
	
	
end
