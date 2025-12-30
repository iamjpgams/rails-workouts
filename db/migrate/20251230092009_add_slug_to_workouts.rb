class AddSlugToWorkouts < ActiveRecord::Migration[8.1]
  def change
    add_column :workouts, :slug, :string
    add_index :workouts, :slug, unique: true
  end
end
