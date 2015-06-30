class CreateBookings < ActiveRecord::Migration
  def change
    create_table :bookings do |t|
      t.references :offer, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true
      t.integer :quantity
      t.datetime :date

      t.timestamps null: false
    end
  end
end
