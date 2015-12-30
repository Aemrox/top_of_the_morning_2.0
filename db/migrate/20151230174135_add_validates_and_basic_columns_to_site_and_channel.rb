class AddValidatesAndBasicColumnsToSiteAndChannel < ActiveRecord::Migration
  def change
    add_column :sites, :validates, :boolean, default: false
    add_column :channels, :basic, :boolean, default: false
  end
end
