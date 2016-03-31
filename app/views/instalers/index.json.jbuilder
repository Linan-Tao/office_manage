json.array!(@instalers) do |instaler|
  json.extract! instaler, :id, :name, :install_type, :phone, :tech_rank, :serve_rank, :price_rank, :secure_rank, :credit_rank
  json.url instaler_url(instaler, format: :json)
end
