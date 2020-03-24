class UsersController < ApplicationController

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
        redirect_to "/users/#{@user.id}"
    end

    def edit 
        @user = User.find(params[:id])
    end

    def update 
        @user = User.find(params[:id])
        @user.update(user_params)
        redirect_to "/users/#{@user.id}"
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to "/welcome"
    end 


    private 
    
    def user_params
        params.require(:user).permit(:name, :user_name, :address, :email, :password, :password_confirmation)
    end
end
