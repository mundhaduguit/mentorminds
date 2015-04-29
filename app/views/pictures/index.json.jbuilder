json.array!(@pictures) do |picture|
  json.extract! picture, :id, :imageable_id, :imageable_type
  json.url picture_url(picture, format: :json)
end
