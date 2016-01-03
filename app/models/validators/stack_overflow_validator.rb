class StackOverflowValidator

  def self.validate(tag)
    url = "http://www.stackoverflow.com/tags/#{tag}"
    if self.scrape(url).css(".summarycount").text == "0"
      false
    else
      true
    end
  end

  private
  def self.scrape(url)
    Nokogiri::HTML(open(url))
  end
end
