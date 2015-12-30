class Channel < ActiveRecord::Base
  belongs_to :site
  has_many :stories
  has_many :user_channels
  has_many :users, through: :user_channels
  include ActiveModel::Validations

  def create_story
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

  #Basic Channels
  def self.basic_channels #returns an array of all basic channels
    self.where("basic = ?", true)
  end

  def basic! #toggles a channel as basic or not
    self.basic ? self.basic = false : self.basic = true
    self.save
  end

  private
  def modifier
    self.name.downcase
  end
end
