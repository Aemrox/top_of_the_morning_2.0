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
    top_article = product_scrape.css("ul.posts--group > li > div")
    title = top_article.css("div:nth-child(3) > a").first.text
    binding.pry
    story_url = "https://www.producthunt.com#{top_article.css("div:nth-child(3) > a").first.attribute("href").value}"
    points = top_article.css("a > span.post-vote-button--count").first.text.to_i

    story_params = {
      title: title,
      url: story_url,
      points: points
    }
  end

end
