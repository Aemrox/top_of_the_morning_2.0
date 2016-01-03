class ProductHuntValidator

  def self.validate(tag)
    choices = ["games","books","podcasts"]
    choices.include?(tag) ? true : false
  end
end
