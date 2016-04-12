class AddSoldToAds < ActiveRecord::Migration
  def change
    add_column :ads, :sold, :boolean
  end
end
