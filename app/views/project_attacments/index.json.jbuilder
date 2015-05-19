json.array!(@project_attacments) do |project_attacment|
  json.extract! project_attacment, :id
  json.url project_attacment_url(project_attacment, format: :json)
end
