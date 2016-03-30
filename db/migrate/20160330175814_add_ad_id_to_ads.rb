class AddAdIdToAds < ActiveRecord::Migration
  def change
    add_reference :ads, :tutoring, index: true, foreign_key: true
  end
end
