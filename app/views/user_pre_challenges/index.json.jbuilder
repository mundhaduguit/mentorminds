json.array!(@user_pre_challenges) do |user_pre_challenge|
  json.extract! user_pre_challenge, :id, :user_id, :pre_challenge_id
  json.url user_pre_challenge_url(user_pre_challenge, format: :json)
end
