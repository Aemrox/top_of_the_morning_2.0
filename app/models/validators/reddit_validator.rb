class RedditValidator
  def self.validate(subreddit)
    site = JSON.parse(RestClient.get("http://reddit.com/r/#{subreddit}/.json"))
    if site["data"]["children"].empty?
      false
    else
      true
    end
  end
end
