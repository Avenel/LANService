class AddNameToUsers < ActiveRecord::Migration
  def change
    add_column :users, :name, :string
    add_column :users, :alias, :string
    add_column :users, :ip, :string
    add_column :users, :pic, :string
    add_column :users, :fav1, :integer
    add_column :users, :fav2, :integer
    add_column :users, :fav3, :integer
    add_column :users, :fav4, :integer
    add_column :users, :fav5, :integer
    add_column :users, :sonstiges, :string
    add_column :users, :currentGame, :integer
  end
end
