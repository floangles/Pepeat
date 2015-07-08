# == Schema Information
#
# Table name: bookings
#
#  id         :integer          not null, primary key
#  offer_id   :integer
#  user_id    :integer
#  quantity   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_bookings_on_offer_id  (offer_id)
#  index_bookings_on_user_id   (user_id)
#

class Booking < ActiveRecord::Base
  belongs_to :offer
  belongs_to :user

  validates :quantity, presence: true
end
