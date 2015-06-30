# == Schema Information
#
# Table name: offers
#
#  id         :integer          not null, primary key
#  recipe_id  :integer
#  portion    :integer
#  startdate  :datetime
#  enddate    :datetime
#  created_at :datetime         not null
#  updated_at :datetime         not null
#
# Indexes
#
#  index_offers_on_recipe_id  (recipe_id)
#

class Offer < ActiveRecord::Base
  belongs_to :recipe
  has_many :bookings

  validates :portion, presence: true
  validates :startdate, presence: true
  validates :enddate, presence: true
end
