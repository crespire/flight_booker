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

25.times do
  (1..8).to_a.each do |i|
    destinations = (1..8).to_a
    destinations.delete(i)
    Flight.create(name: "%s-%03d" % [airline_callsigns.sample, rand(1..999)], depart_time: DateTime.now + rand(100..600), depart_date: Date.today + rand(2..60), flight_duration: rand(43..458.0), origin_airport_id: i, destination_airport_id: destinations.sample)
  end
end

puts "Created 25 flights originating from each airport, #{25 * 8} total."

Flight.all.each do |flight|
  booking = flight.bookings.create
  2.times { booking.passengers.create(flight_id: flight.id, name: 'Jim', email: 'test@test.com') }
end

puts 'Created a booking with 2 passengers for all flights.'