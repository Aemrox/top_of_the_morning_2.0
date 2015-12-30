class ProductHuntScraper
  attr_accessor :category, :url

  def initialize(category)
    @category = category
    @url = "https://www.producthunt.com/#{self.category}"
  end

  def product_scrape
    Nokogiri::HTML(open(url))
  end

  def top_story
    top_article = product_scrape.css(".post-item.v-category-#{category}.v-with-image").first
    title = top_article.css(".post-item--text--name").text
    story_url = "https://www.producthunt.com#{top_article.css(".post-item--text--name").attribute("href")}"
    points = top_article.css("span.post-vote-button--count").text.to_i

    story_params = {
      title: title,
      url: story_url,
      points: points
    }
  end

end
