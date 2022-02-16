class Airport < ApplicationRecord
  has_many :arrivals, class_name: 'Flight', foreign_key: :destination_airport_id
  has_many :departures, class_name: 'Flight', foreign_key: :origin_airport_id
end
