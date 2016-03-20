json.array!(@mix_tasks) do |mix_task|
  json.extract! mix_task, :id, :number, :availability, :file_path
  json.url mix_task_url(mix_task, format: :json)
end
