class SessionController < ApplicationController
  def create
    @user = User.authenticate(params[:email], params[:password])
    if @users
      flash[:notice] = "You've Signed in!"
      session[:user_id] = @user.id
      redirect_to "/"
    else
      flash[:alert] = "There was a problem. Please try signing in again"
      redirect_to signin_path
    end
  end

  def destroy
    session[:user_id] = nil
    flash[:notice] = "You've signed out"
    redirect_to "/"
  end
end
