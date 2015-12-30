class Site < ActiveRecord::Base
  has_many :channels
  has_many :stories, through: :channels
  validates_uniqueness_of :name
  include Scrapable


  def validates! #makes a site validatable
    self.validates ? self.validates = false : self.validates = true
    self.save
  end

end
