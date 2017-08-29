class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.find_by_credentials(params[:user][:username], params[:user][:password])
    if @user.nil?
      flash[:errors] = ["Username or Password invalid!"]
      render :new
    else
      login!(@user)
      render json: @user
      # redirect to somewhere
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end
end
