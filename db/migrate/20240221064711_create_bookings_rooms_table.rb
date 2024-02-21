class CreateBookingsRoomsTable < ActiveRecord::Migration[7.1]
  def change
    create_table :bookings_rooms do |t|
      t.references :booking, null: false, foreign_key: true
      t.references :room, null: false, foreign_key: true
      t.timestamps
    end
  end
end
