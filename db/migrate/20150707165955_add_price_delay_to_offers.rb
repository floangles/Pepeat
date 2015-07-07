class AddPriceDelayToOffers < ActiveRecord::Migration
  def change
    add_column :offers, :price, :integer
    add_column :offers, :delay, :string
  end
end
