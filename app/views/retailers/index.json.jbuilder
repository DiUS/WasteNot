json.array!(@retailers) do |retailer|
  json.extract! retailer, :id, :name, :bio, :web_page, :contact_name, :contact_phone, :contact_email
  json.url retailer_url(retailer, format: :json)
end
