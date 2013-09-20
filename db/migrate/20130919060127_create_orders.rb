class CreateOrders < ActiveRecord::Migration
  def change
    create_table :orders do |t|
      t.string :product
      t.integer :orderer
      t.decimal :price
      t.integer :vendor

      t.timestamps
    end
  end
end
