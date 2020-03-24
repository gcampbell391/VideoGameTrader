class PlatformsController < ApplicationController

    def index 
        @platforms = Platform.all
    end

    def show 
        @platform = Platform.find(params[:id])
    end

    def edit 
        @user = User.find(params[:id])
    end

    def delete 
        @user_platform = UserPlatform.find_by(user_id: session[:user_id], platform_id: params[:user_platform][:platform_id])
        @user_platform.destroy
        redirect_to "/users/#{session[:user_id]}"
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
    

end
