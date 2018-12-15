json.extract! shared_task, :id, :name, :description, :priority, :created_at, :updated_at
json.url shared_task_url(shared_task, format: :json)
