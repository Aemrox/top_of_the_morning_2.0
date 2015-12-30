class Channel < ActiveRecord::Base
  belongs_to :site
  has_many :stories
  has_many :user_channels
  has_many :users, through: :user_channels

  BASIC = [] #determins wether a channel is in the default settings

  #Basic Channels
  def self.basic_channels #returns an array of all basic channels
    BASIC
  end

  def basic! #toggles a channel as basic or not
    if BASIC.include?(self)
      BASIC.delete(self)
    else
      BASIC << self
    end
  end
end
