class Story < ActiveRecord::Base
  has_many :user_channels
  has_many :channels, through: :user_channels
  has_many :stories, through: :channels

  has_secure_password
end
