class CreateOffers < ActiveRecord::Migration
  def change
    create_table :offers do |t|
      t.references :recipe, index: true, foreign_key: true
      t.integer :portion
      t.datetime :startdate
      t.datetime :enddate

      t.timestamps null: false
    end
  end
end
