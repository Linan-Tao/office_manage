json.array!(@material_categories) do |material_category|
  json.extract! material_category, :id, :name
  json.url material_category_url(material_category, format: :json)
end
