class GamesController < ApplicationController

    def new 
        @user = User.find(params[:id])
        @user_game = UserVideoGame.new
    end

    def create 
        @user = User.find(params[:id])
        @user_game = UserVideoGame.create(user_id: @user.id, game_id: params[:user_video_game][:game], tradeable: params[:user_video_game][:tradeable] )
        redirect_to "/users/#{@user.id}"
    end
    def index 
        @games = Game.all
    end

    def show 
        @game = Game.find(params[:id])
    end

    def edit 
        @user = User.find(params[:id])
    end

    def delete 
        @user_game = UserVideoGame.find_by(user_id: session[:user_id], game_id: params[:user_video_games][:game_id])
        @user_game.destroy
        redirect_to "/users/#{session[:user_id]}"
    end
end
