json.array!(@produces) do |produce|
  json.extract! produce, :id, :produce_task_id, :start_time, :end_time, :work
  json.url produce_url(produce, format: :json)
end
