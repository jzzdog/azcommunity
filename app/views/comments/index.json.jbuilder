json.array!(@comments) do |comment|
  json.extract! comment, :id, :body, :user_id, :topic_id, :parent
  json.url comment_url(comment, format: :json)
end
