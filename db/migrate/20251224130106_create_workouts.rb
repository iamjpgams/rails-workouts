class CreateWorkouts < ActiveRecord::Migration[8.1]
  def change
    create_table :workouts do |t|
      t.string :Name
      t.string :Style
      t.text :Desc
      t.string :Score

      t.timestamps
    end
  end
end
