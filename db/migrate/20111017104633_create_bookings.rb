class CreateBookings < ActiveRecord::Migration
  def self.up
    create_table :bookings do |t|
      t.integer :user_id
      t.datetime :booking_time

      t.timestamps
    end
    
    add_index :bookings, :booking_time, :unique => true
  end

  def self.down
    drop_table :bookings
  end
end
