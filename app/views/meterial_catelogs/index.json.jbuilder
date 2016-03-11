json.array!(@meterial_catelogs) do |meterial_catelog|
  json.extract! meterial_catelog, :id, :name
  json.url meterial_catelog_url(meterial_catelog, format: :json)
end
