class Story < ActiveRecord::Base
  belongs_to :channel
  include ActiveModel::Validations
end
