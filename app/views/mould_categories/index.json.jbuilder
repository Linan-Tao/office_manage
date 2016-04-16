json.array!(@mould_categories) do |mould_category|
  json.extract! mould_category, :id, :code, :name
  json.url mould_category_url(mould_category, format: :json)
end
