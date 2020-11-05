class UsersController < ApplicationController

    def index 
        render :json => {:user => User.all}, :status => 200
    end

    def create 
        user = User.create(:name => params[:user][:name], :wins_count => 0, :loses_count => 0)
        render :json => {:user => user}, :status => 201
    end

    def show 
        begin
            user = User.find(params[:id])
            render :json => {:user => user}, :status => 200
        rescue ActiveRecord::RecordNotFound
            render :json => user.errors, :status => 404
        end 
    end

    def destroy
        render :json => User.find(params[:id]).destroy
    end    

    def leaderboard
        users = User.order("wins_count - loses_count DESC")
        render :json => {:user => users}
    end


end
