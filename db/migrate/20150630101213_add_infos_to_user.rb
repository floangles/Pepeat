class AddInfosToUser < ActiveRecord::Migration
  def change
    add_column :users, :firstname, :string
    add_column :users, :lastname, :string
    add_column :users, :birthdate, :date
    add_column :users, :phonenumber, :string
    add_column :users, :sex, :string
    add_column :users, :address, :string
    add_column :users, :pseudo, :string
    add_column :users, :pepeato, :boolean
    add_column :users, :description, :text
    add_column :users, :delay, :string
  end
end
