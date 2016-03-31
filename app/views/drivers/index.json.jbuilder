json.array!(@drivers) do |driver|
  json.extract! driver, :id, :name, :car_type, :car_code, :phone, :serve_rank, :price_rank, :secure_rank, :credit_rank
  json.url driver_url(driver, format: :json)
end
