class CreateRecipes < ActiveRecord::Migration
  def change
    create_table :recipes do |t|
      t.string :name
      t.references :user, index: true, foreign_key: true
      t.integer :numberpers
      t.text :description
      t.string :cooktime
      t.string :preparationtime
      t.integer :price
      t.boolean :halal
      t.boolean :vegan
      t.boolean :vegetarian
      t.boolean :gluten
      t.boolean :lactose
      t.boolean :casher
      t.boolean :bio
      t.references :category, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
