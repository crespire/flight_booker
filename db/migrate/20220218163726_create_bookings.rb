class CreateBookings < ActiveRecord::Migration[6.1]
  def change
    create_table :bookings do |t|
      t.reference :flights, :flight, foreign_key: true

      t.timestamps
    end
  end
end
