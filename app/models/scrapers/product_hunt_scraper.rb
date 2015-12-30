class ProductHuntScraper
  attr_accessor :url

  def initialize(url)
    @url = url
  end

  def product_scrape
    Nokogiri::HTML(open(url))
  end
  
end
