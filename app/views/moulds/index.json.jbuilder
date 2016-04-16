json.array!(@moulds) do |mould|
  json.extract! mould, :id, :code, :name
  json.url mould_url(mould, format: :json)
end
