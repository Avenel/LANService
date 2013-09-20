class CreateGames < ActiveRecord::Migration
  def change
    create_table :games do |t|
      t.string :name
      t.integer :maxPlayers
      t.string :gameModes
      t.string :availableTeams
      t.string :genre
      t.integer :votes

      t.timestamps
    end
  end
end
