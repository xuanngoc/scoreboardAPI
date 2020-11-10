class Api::V1::GamesController < ApplicationController
    
    before_action :doorkeeper_authorize!
    
    def create
        game = Game.create(winner:0)
        player1 = User.find(params[:players][:A])
        player2 = User.find(params[:players][:B])

        GamesPlayer.create(user: player1, game: game, point: 0)
        GamesPlayer.create(user: player2, game: game, point: 0)

        serialize(game, 201)
    end

    def show 
        game = Game.find(params[:id])
        serialize(game, 200)
    end

    def score 
        game = Game.find(params[:id])
        game_player = game.games_players.find_by(user_id: params[:player_id])
        game_player.point += 1
        game_player.save

        serialize(game, 200)
    end

    def reset_point
        game = Game.find(params[:id])
        player = game.games_players.find_by(user_id: params[:player_id])
        player.point = 0
        player.save
        
        serialize(game, 200)
    end

    def end 
        game = Game.find(params[:id])
        player_win = game.games_players.where(point: game.games_players.maximum(:point)).first
        game.winner = player_win.user_id
        game.save        
        user = User.find(player_win.user_id)
        user.wins_count += 1
        user.save

        serialize(game, 200)
    end

    def leaderboard
        users = User.order("wins_count - loses_count DESC")
        render :json => {:players => users}
    end

    private 

    def serialize(game, status) 
        render :json => {game: {
            id: game.id,
            players: game.games_players.map { |gp| {id: gp.user_id, point: gp.point} },
            winner: game.winner

        }}, :status => status
    end

end
