# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Airport.create(name: 'Toronto Pearson', code: 'YYZ')
Airport.create(name: 'Vancouver International', code: 'YWG')
Airport.create(name: 'Calgary International', code: 'YYC')
Airport.create(name: 'New York JFK', code: 'JFK')
Airport.create(name: 'New York LaGuardia', code: 'LGA')
Airport.create(name: 'Dallas/Fort Worth', code: 'DFW')
Airport.create(name: 'Los Angeles', code: 'LAX')
Airport.create(name: 'Denver', code: 'DEN')

puts 'Created 8 airports'

airline_callsigns = %w[AC AS AA DL FX NW SW WS]

50.times do
  Flight.create(name: "%s-%03d" % [airline_callsigns.sample, rand(1..999)], depart_time: DateTime.now + rand(2..60), flight_duration: rand(43..458.0), origin_airport_id: rand(1..8), destination_airport_id: rand(1..8))
end

puts 'Created 50 flights.'
