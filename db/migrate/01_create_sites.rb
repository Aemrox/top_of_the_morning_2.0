class CreateSites < ActiveRecord::Migration
  def change
    create_table :sites do |t|
      t.string :name
      t.string :url
      t.string :channel_url
      t.boolean :validates, default: false
    end
  end
end
