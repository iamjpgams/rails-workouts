json.extract! workout, :id, :Name, :Style, :Desc, :Score, :created_at, :updated_at
json.url workout_url(workout, format: :json)
