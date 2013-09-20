# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :order do
    product "MyString"
    orderer 1
    price "9.99"
    vendor 1
  end
end
