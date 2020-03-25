class SessionsController < ApplicationController
  skip_before_action :authorized, only: [:new, :create, :welcome]

  def new
  end

    def create
      @user = User.find_by(user_name: params[:user_name])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect_to "/users/#{@user.id}"
      else
        flash[:notice] = "Please make sure you use a valid username and password!"
        redirect_to '/login'
      end
  end

  def page_requires_login
  end
end
