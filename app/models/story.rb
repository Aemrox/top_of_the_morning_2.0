class Story < ActiveRecord::Base
  belongs_to :channel
  validates_uniqueness_of :title
end
