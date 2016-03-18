class CreateElectronics < ActiveRecord::Migration
  def change
    create_table :electronics do |t|
      t.belongs_to :ad

      t.string :brand
      t.string :model

      t.timestamps null: false
    end
  end
end
