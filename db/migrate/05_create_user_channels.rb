class CreateUserChannels < ActiveRecord::Migration
  def change
    create_table :user_channels do |t|
      t.belongs_to :user,  index: true
      t.belongs_to :channel,  index: true
    end
  end
end
