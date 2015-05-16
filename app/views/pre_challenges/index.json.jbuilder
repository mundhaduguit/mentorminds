json.array!(@pre_challenges) do |pre_challenge|
  json.extract! pre_challenge, :id, :name
  json.url pre_challenge_url(pre_challenge, format: :json)
end
