class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.belongs_to :ad
      t.string :ISBN

      t.timestamps null: false
    end
  end
end
