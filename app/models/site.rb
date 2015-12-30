class Site < ActiveRecord::Base
  has_many :channels
  has_many :stories, through: :channels


#Determines whether the site is validatable, validatable sites are stored in this array
  VALIDATES = []

  def validates! #makes a site validatable
    VALIDATES << self
  end

  def validates? #returns true or false if site is validatable
    VALIDATES.include?(self)
  end

  include Scrapable
end
