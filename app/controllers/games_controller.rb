class GamesController < ApplicationController

    def create
        game = Game.create(winner:0)
        player1 = User.find(params[:players][:A])
        player2 = User.find(params[:players][:B])

        GamesPlayer.create(user: player1, game: game, point: 0)
        GamesPlayer.create(user: player2, game: game, point: 0)

        render :json => {game: {
            id: game.id,
            players: game.games_players.map { |gp| {id: gp.user_id, point: gp.point} },
            winner: game.winner
            
        }}, :status => 201
    end

end
