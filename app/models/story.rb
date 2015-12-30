class Story < ActiveRecord::Base
  belongs_to :channel
  validates_uniqueness_of :title

  def full_title
    if self.channel.basic
      title = self.channel.name + ": " + self.title
    else
      title = self.channel.site.name + " - " + self.channel.name + ": " + self.title
    #   title = story.channel.site.name + " - " story.channel.name + ": " + story.title
    end
  end
end
