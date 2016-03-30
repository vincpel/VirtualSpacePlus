class CreateTutorings < ActiveRecord::Migration
  def change
    create_table :tutorings do |t|
      t.belongs_to :ad
      t.string :course

      t.timestamps null: false
    end
  end
end
