json.array!(@produce_tasks) do |produce_task|
  json.extract! produce_task, :id
  json.url produce_task_url(produce_task, format: :json)
end
