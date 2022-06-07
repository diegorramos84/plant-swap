class CreateBookings < ActiveRecord::Migration[7.0]
  def change
    create_table :bookings do |t|
      t.string :booking_status
      t.references :user, null: false, foreign_key: true
      t.references :plant, null: false, foreign_key: true

      t.timestamps
    end
  end
end
