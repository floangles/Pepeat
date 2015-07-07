class AddRankToRecipe < ActiveRecord::Migration
  def change
    add_column :recipes, :rank, :integer
  end
end
