json.array!(@produce_tasks) do |produce_task|
  json.extract! produce_task, :id, :order_id, :material_category_id, :material_type, :sequence, :area, :mix_task_id, :mix_status, :availability, :work
  json.url produce_task_url(produce_task, format: :json)
end
