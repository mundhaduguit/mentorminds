json.array!(@pre_challenge_events) do |pre_challenge_event|
  json.extract! pre_challenge_event, :id, :state
  json.url pre_challenge_event_url(pre_challenge_event, format: :json)
end
