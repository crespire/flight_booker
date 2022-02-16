class CreateFlights < ActiveRecord::Migration[6.1]
  def change
    create_table :flights do |t|
      t.string :name
      t.datetime :depart_time
      t.decimal :flight_duration
      t.integer :origin_airport_id
      t.integer :destination_airport_id

      t.timestamps
    end
  end
end
