json.array!(@tutorings) do |tutoring|
  json.extract! tutoring, :id, :course
  json.url tutoring_url(tutoring, format: :json)
end
