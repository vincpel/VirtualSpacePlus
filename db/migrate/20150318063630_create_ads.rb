class CreateAds < ActiveRecord::Migration
  def change
    create_table :ads do |t|
      t.belongs_to :book
      t.belongs_to :electronic
	    
      t.string   "title",       limit: 255
      t.text     "description", limit: 65535
      t.integer  "user_id",     limit: 4
      t.string   "attachment",  limit:255
      t.timestamps null: false
    end
  end
end
