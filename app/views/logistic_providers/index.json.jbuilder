json.array!(@logistic_providers) do |logistic_provider|
  json.extract! logistic_provider, :id, :name, :director, :address, :phone, :qq, :delivery_way, :arrival_cycle, :serve_rank, :price_rank, :secure_rank, :credit_rank
  json.url logistic_provider_url(logistic_provider, format: :json)
end
