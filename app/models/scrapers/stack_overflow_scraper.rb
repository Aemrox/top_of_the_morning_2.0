class StackOverflowScraper
  attr_accessor :tag

  def initialize(tag='ruby')
    @tag = tag
  end

  def import
    RubyStackoverflow.featured_questions({page: 1, tagged:tag}).data
  end

  def top_story
    raw = self.import
    raw.sort_by!{|story| story.bounty_amount}
    title = raw[-1].title
    points = raw[-1].bounty_amount
    url = raw[-1].link


    story_params = {
      title: title,
      url: url,
      points: points
    }
  end
end
