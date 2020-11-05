class ChangeDataTypeForPoint < ActiveRecord::Migration[5.2]
  def change
    change_column :games_players, :point, 'integer USING CAST(point AS integer)'
  end
end
