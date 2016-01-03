class Channel < ActiveRecord::Base
  belongs_to :site
  has_many :stories
  has_many :user_channels
  has_many :users, through: :user_channels

  validates_uniqueness_of :name
  include ActiveModel::Validations

  def create_story
    #checks to see
    if (stories.last) && (time_since_last_story < 600)
      stories.last
    else
      if self.basic
        story_params = self.site.scrape
      else #if it is not a basic channel, it must pass a modifier, which is it's downcased name
        story_params = self.site.scrape(modifier)
      end
      new_story = Story.new(story_params)
      new_story.channel = self
      new_story.save
      new_story
    end
  end

  def full_name
    self.basic ? self.name : self.site.name + " - " + self.name.capitalize
  end

  #Basic Channels
  def self.basic_channels #returns an array of all basic channels
    self.where("basic = ?", true)
  end

  def basic! #toggles a channel as basic or not
    self.basic ? self.basic = false : self.basic = true
    self.save
  end

  def time_since_last_story
    now = Time.now
    if (self.stories.last.updated_at)
      (now - self.stories.last.updated_at).to_i
    else
      0
    end
  end

  def modifier
    self.name.downcase
  end
end
