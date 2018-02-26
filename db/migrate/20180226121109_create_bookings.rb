class CreateBookings < ActiveRecord::Migration[5.1]
  def change
    create_table :bookings do |t|
      t.integer :quantity
      t.references :user, foreign_key: true
      t.references :voucher, foreign_key: true

      t.timestamps
    end
  end
end
