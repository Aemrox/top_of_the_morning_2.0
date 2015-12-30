class User < ActiveRecord::Base
  has_many :user_channels
  has_many :channels, through: :user_channels
  has_many :stories, through: :channels

  validates_uniqueness_of :username

  has_secure_password

  def self.create(options = {})
    new_user = super(options)
    Channel.basic_channels.each do |channel|
      new_user.channels << channel
    end
    new_user.save
    new_user
  end
end
