class Game < ActiveRecord::Base
  attr_accessible :availableTeams, :gameModes, :genre, :maxPlayers, :name
end
