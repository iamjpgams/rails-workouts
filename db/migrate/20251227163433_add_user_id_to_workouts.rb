class AddUserIdToWorkouts < ActiveRecord::Migration[8.1]
  def change
    add_column :workouts, :user_id, :integer
    add_index :workouts, :user_id
  end
end
