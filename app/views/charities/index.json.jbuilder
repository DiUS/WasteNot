json.array!(@charities) do |charity|
  json.extract! charity, :id, :name, :webpage, :contact_name, :contact_email, :contact_phone
  json.url charity_url(charity, format: :json)
end
