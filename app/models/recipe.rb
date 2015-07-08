# == Schema Information
#
# Table name: recipes
#
#  id                   :integer          not null, primary key
#  name                 :string
#  user_id              :integer
#  numberpers           :integer
#  description          :text
#  cooktime             :string
#  preparationtime      :string
#  price                :integer
#  halal                :boolean
#  vegan                :boolean
#  vegetarian           :boolean
#  gluten               :boolean
#  lactose              :boolean
#  casher               :boolean
#  bio                  :boolean
#  category_id          :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#  picture_file_name    :string
#  picture_content_type :string
#  picture_file_size    :integer
#  picture_updated_at   :datetime
#  rank                 :integer
#
# Indexes
#
#  index_recipes_on_category_id  (category_id)
#  index_recipes_on_user_id      (user_id)
#

class Recipe < ActiveRecord::Base

  include AlgoliaSearch
  belongs_to :user
  belongs_to :category
  has_many :ingredients, through: :composition
  has_many :composition
  has_many :offers, dependent: :destroy
  validates :name, presence: true
  validates :numberpers, presence: true
  validates :description, presence: true
  validates :cooktime, presence: true
  validates :preparationtime, presence: true

  has_attached_file :picture,
    styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
    content_type: /\Aimage\/.*\z/


  algoliasearch do
    add_attribute :medium_picture_url
    add_attribute :rank
  end


  def medium_picture_url
    picture.url(:medium)
  end
end
