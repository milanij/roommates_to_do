class SessionsController < ApplicationController

include ApplicationHelper

  def new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user && @user.authenticate(params[:session][:password])
      session_create
      flash.now[:notice] = "You have successfully logged in."
      redirect_to lists_path
    else
      flash.now[:notice] = "Invalid login/password combination. Please try again."
      render :new
    end

  end

  def destroy
    # @user = User.find(params[:name])
    session.delete(:remember_token)
    flash.now[:goodbye] = "Goodbye. Come back soon."  
    render :new
  end

end
