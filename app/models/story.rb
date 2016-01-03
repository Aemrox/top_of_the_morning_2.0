class Story < ActiveRecord::Base
  belongs_to :channel
  validates_uniqueness_of :title

  def full_title
    self.channel.full_name + ": " + self.title
  end
end
