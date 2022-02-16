json.extract! flight, :id, :name, :depart_time, :flight_duration, :origin_airport_id, :destination_airport_id, :created_at, :updated_at
json.url flight_url(flight, format: :json)
