json.array!(@materials) do |material|
  json.extract! material, :id, :material_category, :material_type, :number, :price, :code, :unit, :supplier
  json.url material_url(material, format: :json)
end
