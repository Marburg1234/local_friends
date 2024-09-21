json.data do
  json.item do
    json.id @region.id
    json.name @region.name
    json.latitude @region.latitude
    json.longitude @region.longitude
  end
end