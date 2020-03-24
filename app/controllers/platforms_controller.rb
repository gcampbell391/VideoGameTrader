class PlatformsController < ApplicationController

    def index 
        @platforms = Platform.all
    end

    def show 
        @platform = Platform.find(params[:id])
    end


    def new
        @platform = Platform.new
        @user = User.find(params[:id])
    end 

    def create 
        @user = User.find(params[:id])
        @user_platform = UserPlatform.create(user_id: @user.id, platform_id: params[:user_platform][:platform_id].to_i)
        redirect_to "/users/#{@user.id}"
    end 
    

    # @user = User.find(params[:id])
    # @user_game = UserVideoGame.create(user_id: @user.id, game_id: params[:user_video_game][:game], tradeable: params[:user_video_game][:tradeable] )
    # redirect_to "/users/#{@user.id}"
end
