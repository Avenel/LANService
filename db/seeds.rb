# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
# Environment variables (ENV['...']) can be set in the file config/application.yml.
# See http://railsapps.github.io/rails-environment-variables.html
puts 'ROLES'

Role.find_or_create_by_name({ :name => "ADMIN" }, :without_protection => true)
Role.find_or_create_by_name({ :name => "USER" }, :without_protection => true)

user = User.find_or_create_by_email :name => "Martin", :email => "martin.briewig@googlemail.com", :password => "1234", :password_confirmation => "1234"
puts 'user: ' << user.name
user.add_role :admin

user = User.find_or_create_by_email :name => "Thilo", :email => "thilo@example.com", :password => "1234", :password_confirmation => "1234"
puts 'user: ' << user.name
user.add_role :user

games = Game.create([ 
	{name: 'Age of Empires 2', genre: 'Strategie'},
	{name: 'Aliens vs Predetor 2', genre: 'Shooter'},
	{name: 'Battlefield 2', genre: 'Shooter'},
	{name: 'Battlefield 1942', genre: 'Shooter'},
	{name: 'Burnout Paradise', genre: 'Rennspiel'},
	{name: 'C&C Generals', genre: 'Strategie'},
	{name: 'C&C Red Alert 2', genre: 'Strategie'},
	{name: 'Call of Duty', genre: 'Shooter'},
	{name: 'Call of Duty 4', genre: 'Shooter'},
	{name: 'Counter Strike 1.6', genre: 'Shooter'},
	{name: 'Counter Strike Source', genre: 'Shooter'},
	{name: 'Cube World', genre: 'Open World Action RPG'},
	{name: 'Day of Defeat', genre: 'Shooter'},
	{name: 'Flatout', genre: 'Rennspiel'},
	{name: 'Flatout 2', genre: 'Rennspiel'},
	{name: 'Desert Combat', genre: 'Shooter'},
	{name: 'Jedi Knight', genre: 'Shooter'},
	{name: 'GTA 2', genre: 'Action RPG'},
	{name: 'Half-Life Deathmatch', genre: 'Shooter'},
	{name: 'Halo', genre: 'Shooter'},
	{name: 'Quake 3', genre: 'Shooter'},
	{name: 'Rune', genre: 'Schwertkampf'},
	{name: 'Serious Sam', genre: 'Shooter'},
	{name: 'Serious Sam HD', genre: 'Shooter'},
	{name: 'Soldat', genre: 'Shooter'},
	{name: 'Soldier of Fortune 2', genre: 'Shooter'},
	{name: 'Starcraft', genre: 'Strategie'},
	{name: 'Stronghold Crusader', genre: 'Strategie'},
	{name: 'SWAT 4', genre: 'Shooter'},
	{name: 'Team Fortress 2', genre: 'Shooter'},
	{name: 'Tony Hawks Pro Skater 4', genre: 'Sport'},
	{name: 'Unreal Tournament', genre: 'Shooter'},
	{name: 'Unreal Tournament 2004', genre: 'Shooter'},
	{name: 'Unreal Tournament 3', genre: 'Shooter'},
	{name: 'Warcraft 3', genre: 'Strategie'},
	{name: 'Worms', genre: 'Rundenbasiert'},
 ])