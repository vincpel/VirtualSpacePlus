class AddCriteriaToResearches < ActiveRecord::Migration
  def change
    add_column :researches, :criteria, :string
  end
end
