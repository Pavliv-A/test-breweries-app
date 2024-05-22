class BreweriesController < ApplicationController
  def index
    @breweries = fetch_breweries(params[:query])
  end

  private

  def fetch_breweries(query = nil)
    url = if query.present?
            "https://api.openbrewerydb.org/breweries?by_name=#{query}&per_page=10"
          else
            "https://api.openbrewerydb.org/breweries?per_page=10"
          end
    response = HTTParty.get(url)
    if response.success?
      response.parsed_response
    else
      []
    end
  end
end
