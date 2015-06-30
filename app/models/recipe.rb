# == Schema Information
#
# Table name: recipes
#
#  id              :integer          not null, primary key
#  name            :string
#  user_id         :integer
#  numberpers      :integer
#  description     :text
#  cooktime        :string
#  preparationtime :string
#  price           :integer
#  halal           :boolean
#  vegan           :boolean
#  vegetarian      :boolean
#  gluten          :boolean
#  lactose         :boolean
#  casher          :boolean
#  bio             :boolean
#  category_id     :integer
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
# Indexes
#
#  index_recipes_on_category_id  (category_id)
#  index_recipes_on_user_id      (user_id)
#

class Recipe < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :category
  has_many :ingredients, through: :composition
  has_many :composition
  has_many :offers
  validates :name, presence: true
  validates :numberpers, presence: true
  validates :description, presence: true
  validates :cooktime, presence: true
  validates :preparationtime, presence: true
  validates :price, presence: true



end
