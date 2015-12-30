class Channel < ActiveRecord::Base
  belongs_to :site
  has_many :stories
  has_many :user_channels
  has_many :users, through: :user_channels



  #Basic Channels
  def self.basic_channels #returns an array of all basic channels
    self.where("basic = ?", true)
  end

  def basic! #toggles a channel as basic or not
    self.basic ? self.basic = false : self.basic = true
    self.save
  end
end
