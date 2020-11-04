class Game < ApplicationRecord
    has_many :games_players
    has_many :users, through: :games_players
end
