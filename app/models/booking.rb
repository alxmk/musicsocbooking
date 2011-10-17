class Booking < ActiveRecord::Base
  
  belongs_to :user
  
  default_scope :order => 'bookings.booking_time'
  
  def self.this_week
    all
  end
  
end

# == Schema Information
#
# Table name: bookings
#
#  id           :integer         not null, primary key
#  user_id      :integer
#  booking_time :datetime
#  created_at   :datetime
#  updated_at   :datetime
#

