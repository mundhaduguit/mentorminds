json.array!(@user_challenges) do |user_challenge|
  json.extract! user_challenge, :id, :user_id, :challenge_id, :locked, :marks
  json.url user_challenge_url(user_challenge, format: :json)
end
