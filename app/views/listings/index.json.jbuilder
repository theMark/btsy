json.array!(@listings) do |listing|
  json.extract! listing, :id, :title, :description, :etsy_user_id, :price, :etsy_listing_id
  json.url listing_url(listing, format: :json)
end
