json.array!(@workgroups) do |workgroup|
  json.extract! workgroup, :id, :course
  json.url workgroup_url(workgroup, format: :json)
end
