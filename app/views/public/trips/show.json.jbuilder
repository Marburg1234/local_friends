json.data do
  json.item do

    json.id @trip.id
    json.user do
      json.name @trip.user.first_name
      json.image url_for(@trip.user.get_profile_image)
    end
    json.image url_for(@trip.trip_image)
    json.title @trip.title
    json.explain @trip.explain
    json.post_code @trip.post_code
    json.address @trip.address
    json.latitude @trip.latitude
    json.longitude @trip.longitude

  end
end