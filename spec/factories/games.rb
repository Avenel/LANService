# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :game do
    name "MyString"
    maxPlayers ""
    gameModes "MyString"
    availableTeams "MyString"
    genre "MyString"
  end
end
