class ProductHuntScraper
  attr_accessor :category, :url

  def initialize(category="tech")
    @category = category
    @url = "https://www.producthunt.com/#{self.category}"
  end

  def product_scrape
    # binding.pry
    Nokogiri::HTML(open(url))
  end

  def top_story
    # binding.pry
    top_article = product_scrape.css("ul.posts--group > li > div")
    # binding.pry
    title = top_article.css("div:nth-child(3) > a").first.text
    story_url = "https://www.producthunt.com#{top_article.css("div:nth-child(3) > a").first.attribute("href").value}"
    points = top_article.css("a > span.post-vote-button--count").first.text.to_i

    story_params = {
      title: title,
      url: story_url,
      points: points
    }
  end

  def under_construction
    story_params={
      title: "We apologize! Product Hunt is currently unavailable. Please feel free to navigate to the site directly",
      url: "www.producthunt.com",
      points: 0
    }
  end

end
