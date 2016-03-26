json.array!(@out_storages) do |out_storage|
  json.extract! out_storage, :id, :out_date, :department_id, :out_user, :produce_task_id, :item_id, :item_type, :number, :user_id
  json.url out_storage_url(out_storage, format: :json)
end
