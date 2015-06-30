# == Schema Information
#
# Table name: compositions
#
#  id            :integer          not null, primary key
#  recipe_id     :integer
#  ingredient_id :integer
#  quantity      :string
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#
# Indexes
#
#  index_compositions_on_ingredient_id  (ingredient_id)
#  index_compositions_on_recipe_id      (recipe_id)
#

class Composition < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
  validates :quantity, presence: true
end
