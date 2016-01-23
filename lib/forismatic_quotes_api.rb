require 'delegate'
require 'faraday'

class ForismaticQuotesApi < DelegateClass(Faraday::Connection)
  def initialize(**options)
    super Faraday.new(url: 'http://api.forismatic.com/api/1.0/', **options) do |faraday|
      faraday.request  :url_encoded             # form-encode POST params
      faraday.response :logger                  # log requests to STDOUT
      faraday.adapter  Faraday.default_adapter  # make requests with Net::HTTP
      yield faraday if block_given?
    end
  end
  
  
end