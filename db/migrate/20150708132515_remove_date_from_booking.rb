class RemoveDateFromBooking < ActiveRecord::Migration
  def change
    remove_column :bookings, :date, :datetime
  end
end
