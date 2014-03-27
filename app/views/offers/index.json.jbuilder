json.array!(@offers) do |offer|
  json.extract! offer, :id, :title, :description, :retailer, :location
  json.url offer_url(offer, format: :json)
end
