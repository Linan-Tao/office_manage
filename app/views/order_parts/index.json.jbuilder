json.array!(@order_parts) do |order_part|
  json.extract! order_part, :id
  json.url order_part_url(order_part, format: :json)
end
