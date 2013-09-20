class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :product
      t.integer :orderer
      t.decimal :price
      t.integer :vendor
      t.integer :payed

      t.timestamps
    end
  end
end
