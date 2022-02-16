class Flight < ApplicationRecord
  belongs_to :destination, class_name: 'Airport', foreign_key: :destination_airport_id
  belongs_to :origin, class_name: 'Airport', foreign_key: :origin_airport_id
end
