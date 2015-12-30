class ProductHuntScraper
  attr_accessor :category, :url

  def initialize(category="tech")
    @category = category
    @url = "https://www.producthunt.com/#{self.category}"
  end

  def product_scrape
    Nokogiri::HTML(open(url))
  end

  def top_story
    top_article = product_scrape.css("#app > div > div > div > ul > li:nth-child(1) > div > div > div.container > ul > li:nth-child(1) > div")
    title = top_article.css("div.information_3xzIn > a").text
    story_url = "https://www.producthunt.com#{top_article.css("div.information_3xzIn > a").attribute("href").value}"
    points = top_article.css("a > span.post-vote-button--count").text.to_i

    story_params = {
      title: title,
      url: story_url,
      points: points
    }
  end

end
