

json.array!(@comments) do |comment|
	
  json.extract! comment, :id, :text, :ad_id
  json.extract! comment.user, :email

  json.url comment_url(comment, format: :json)
end


