class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :alias, :string
    add_column :users, :ip, :string
    add_column :users, :pic, :string
    add_column :users, :fav1, :string
    add_column :users, :fav2, :string
    add_column :users, :fav3, :string
    add_column :users, :fav4, :string
    add_column :users, :fav5, :string
    add_column :users, :sonstiges, :string
  end
end
