class CreateGamesPlayers < ActiveRecord::Migration[5.2]
  def change
    create_table :games_players, :id => false do |t|
      t.string :point
      t.references :user, foreign_key: true
      t.references :game, foreign_key: true

      t.timestamps
    end
  end
end
