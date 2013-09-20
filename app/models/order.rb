class Order < ActiveRecord::Base
  attr_accessible :orderer, :price, :product, :vendor, :payed
end
