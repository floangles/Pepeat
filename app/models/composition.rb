class Composition < ActiveRecord::Base
  belongs_to :recipe
  belongs_to :ingredient
end
