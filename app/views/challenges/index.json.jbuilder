json.array!(@challenges) do |challenge|
  json.extract! challenge, :id, :question, :answer
  json.url challenge_url(challenge, format: :json)
end
