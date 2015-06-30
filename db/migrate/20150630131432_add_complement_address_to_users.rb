class AddComplementAddressToUsers < ActiveRecord::Migration
  def change
    add_column :users, :city, :string
    add_column :users, :zipcode, :integer
  end
end
