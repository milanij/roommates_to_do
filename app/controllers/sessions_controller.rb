class SessionsController < ApplicationController
  
  include SessionsHelper

  def new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user && @user.authenticate(params[:session][:password])
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to items_path
    else
      render new_session_path, error: "Invalid email/password combination. Please try again."
    end

  end

  def destroy
    session.delete(:remember_token)
    redirect_to :root
  end

end
