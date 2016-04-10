json.array!(@order_unions) do |order_union|
  json.extract! order_union, :id, :code, :agent_id
  json.url order_union_url(order_union, format: :json)
end
