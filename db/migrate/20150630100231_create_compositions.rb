class CreateCompositions < ActiveRecord::Migration
  def change
    create_table :compositions do |t|
      t.references :recipe, index: true, foreign_key: true
      t.references :ingredient, index: true, foreign_key: true
      t.string :quantity

      t.timestamps null: false
    end
  end
end
