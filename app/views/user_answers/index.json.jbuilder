json.array!(@user_answers) do |user_answer|
  json.extract! user_answer, :id, :answer, :user_id, :user_challenge_id
  json.url user_answer_url(user_answer, format: :json)
end
