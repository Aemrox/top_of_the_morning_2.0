class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.belongs_to :site, index: true, foreign_key: true
    end
  end
end
