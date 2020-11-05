class AddIdToGamesPlayers < ActiveRecord::Migration[5.2]
  def change
    add_column :games_players, :id, :primary_key
  end
end
