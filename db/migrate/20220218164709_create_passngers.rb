class CreatePassngers < ActiveRecord::Migration[6.1]
  def change
    create_table :passngers do |t|
      t.string, :name
      t.string :email
      t.reference :booking

      t.timestamps
    end
  end
end
