json.array!(@item_storages) do |item_storage|
  json.extract! item_storage, :id, :storage_date, :receiver, :purchase, :item_id, :item_type, :brand, :number, :supplier_id
  json.url item_storage_url(item_storage, format: :json)
end
