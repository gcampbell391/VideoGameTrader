class UsersController < ApplicationController
    skip_before_action :authorized, only: [:new, :create]

    def index 
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new 
        @user = User.new 
    end

    def create 
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user)
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to user_path(@user)
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to "/welcome"
    end 

    def logout
        reset_session
        redirect_to "/welcome"
    end


    def trade 

        @user1 = User.find(session[:user_id])
        session[:user2] = User.find(params[:id])
        @user2 = session[:user2]
        session[:game2] = Game.find_by(title: params[:title])
        render :trade
    end

    def complete_trade 
        @first_users_game = UserVideoGame.find_by(user_id: session[:user_id], game_id: params[:user_video_games][:game_id])
        @second_users_game = UserVideoGame.find_by(user_id: session[:user2]["id"], game_id: session[:game2]["id"])
        @user1_new_game = UserVideoGame.create(user_id: session[:user_id], game_id: session[:game2]["id"])
        @user2_new_game = UserVideoGame.create(user_id: session[:user2]["id"], game_id: params[:user_video_games][:game_id])
        @first_users_game.destroy
        @second_users_game.destroy
        redirect_to user_path(session[:user_id])
    end 

    private 
    
    def user_params
        params.require(:user).permit(:name, :user_name, :address, :email, :password, :password_confirmation)
    end
end
