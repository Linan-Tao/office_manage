json.array!(@assets) do |asset|
  json.extract! asset, :id, :name, :total, :remain_value, :buy_date, :note, :number
  json.url asset_url(asset, format: :json)
end
