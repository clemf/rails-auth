class SessionsController < ApplicationController
  def new
  end

  def create
    @user = User.authenticate(params[:email], params[:password])
    if @user
      flash[:notice] = 'You\'ve been logged in.'
      session[:user_id] = @user.id
      redirect to root_path
    else
      flash[:alert] = 'There was a problem loggin you in.'
      redirect_to log_in_path
    end
  end

  def destroy
  end
end
