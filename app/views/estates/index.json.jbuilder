json.array!(@estates) do |estate|
  json.extract! estate, :id, :name, :total, :remain_value, :buy_date, :note, :number
  json.url estate_url(estate, format: :json)
end
