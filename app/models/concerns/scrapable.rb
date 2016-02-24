module Scrapable
  #holds all the various scraper codes
  #ProductHunt

  def scrape(modifier = nil)
    #directs to the proper scraper and returns proper result
    #will be a growing case statement based on self(being a site).name
    #will return a story_param with which to build a story
    #building the actual story object will be the responsibility of the channel

    case self.name
    when "Reddit"
      RedditScraper.new(modifier).top_story
    when "Product Hunt"
      !!modifier ? category = modifier : category = "tech"
      ProductHuntScraper.new(category).under_construction
    when "Stack Overflow"
      !!modifier ? tag = modifier : tage = "ruby"
      StackOverflowScraper.new(tag).top_story
    when "Hacker News"
      HackerNewsScraper.new.top_story
    end
  end

  def validate(tag)
    case self.name
    when "Reddit"
      RedditValidator.validate(tag)
    when "Product Hunt"
      ProductHuntValidator.validate(tag)
    when "Stack Overflow"
      StackOverflowValidator.validate(tag)
    else
      false
    end
  end
end
