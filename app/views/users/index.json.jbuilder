json.array!(@users) do |user|
  json.extract! user, :id, :email, :user_name, :collage, :course, :date_of_birth, :gender
  json.url user_url(user, format: :json)
end
