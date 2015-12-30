class HackerNewsScraper
  include RubyHackernews

  def importer
    Entry.all.first
  end

  def top_story
    top_story = importer
    title = top_story.link.title
    url = top_story.link.href
    points = top_story.voting.score

    story_params = {
      title: title,
      url: url,
      points: points
    }
  end
end
