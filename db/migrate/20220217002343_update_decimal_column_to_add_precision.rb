class UpdateDecimalColumnToAddPrecision < ActiveRecord::Migration[6.1]
  def change
    change_column :flights, :flight_duration, :decimal, precision: 6, scale:2
  end
end
