json.array!(@endorsements) do |endorsement|
  json.extract! endorsement, :id, :stars, :comment
  json.url endorsement_url(endorsement, format: :json)
end
