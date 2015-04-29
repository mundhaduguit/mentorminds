json.array!(@industry_categories) do |industry_category|
  json.extract! industry_category, :id, :name, :description, :parent_id
  json.url industry_category_url(industry_category, format: :json)
end
