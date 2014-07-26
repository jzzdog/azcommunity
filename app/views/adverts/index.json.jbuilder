json.array!(@adverts) do |advert|
  json.extract! advert, :id, :title, :description, :image_url, :price, :user_id, :created
  json.url advert_url(advert, format: :json)
end
