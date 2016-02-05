class AddElectronicToAdd < ActiveRecord::Migration
  def change
    add_column :adds, :brand, :string
  end
end
