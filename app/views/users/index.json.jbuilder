json.array!(@users) do |user|
  json.extract! user, :id, :name, :office, :phone, :mail
  json.url user_url(user, format: :json)
end
