class Passenger < ApplicationRecord
  validates :name, presence: true
  validates :email, format: { with: /\A(\S+)@(.+)\.(\S+)\z/, message: 'format invalid' }, presence: true
  validates :booking_id, presence: true
  validates :flight_id, presence: true

  belongs_to :booking
  has_one :flight, through: :booking
end
