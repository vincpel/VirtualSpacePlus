json.array!(@workgroups) do |workgroup|
  json.extract! workgroup, :id, :course
  json.url tutoring_url(workgroup, format: :json)
end
