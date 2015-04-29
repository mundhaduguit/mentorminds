json.array!(@industries) do |industry|
  json.extract! industry, :id, :name, :description, :industry_category_id
  json.url industry_url(industry, format: :json)
end
