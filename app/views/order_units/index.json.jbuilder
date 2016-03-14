json.array!(@order_units) do |order_unit|
  json.extract! order_unit, :id
  json.url order_unit_url(order_unit, format: :json)
end
