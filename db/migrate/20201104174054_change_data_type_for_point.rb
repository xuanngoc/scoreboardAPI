class ChangeDataTypeForPoint < ActiveRecord::Migration[5.2]
  def change
    change_column :games_players, :point, :integer
  end
end
