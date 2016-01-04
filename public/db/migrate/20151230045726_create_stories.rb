class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :title
      t.string :url
      t.belongs_to :channel,  index: true, foreign_key: true
    end
  end
end
