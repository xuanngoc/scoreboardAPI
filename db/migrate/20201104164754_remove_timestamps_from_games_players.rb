class RemoveTimestampsFromGamesPlayers < ActiveRecord::Migration[5.2]
  def change
    remove_column :games_players, :created_at, :string
    remove_column :games_players, :updated_at, :string
  end
end
