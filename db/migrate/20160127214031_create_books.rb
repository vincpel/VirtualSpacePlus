class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.text :description
      t.string :isbn
      t.belongs_to :user, index:true
      t.timestamps null: false
    end
  end
end
