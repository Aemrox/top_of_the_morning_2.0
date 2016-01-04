class CreateChannels < ActiveRecord::Migration
  def change
    create_table :channels do |t|
      t.string :name
      t.belongs_to :site, index: true
      t.boolean :basic, default: false
    end
  end
end
