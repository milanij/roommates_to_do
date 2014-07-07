class SessionsController < ApplicationController

include ApplicationHelper

  def new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user && @user.authenticate(params[:session][:password])
      session_create
      redirect_to lists_path
      flash[:notice] = "You have successfully logged in."
    else
      render :new
      flash[:notice] = "Invalid login/password combination. Please try again."
    end

  end

  def destroy
    if session[:remember_token] == nil
      render :new
    else
      @user = User.find(session[:remember_token])
      @user_bye = @user.name.capitalize
      session.delete(:remember_token)  
      flash[:goodbye] = "Goodbye, #{@user_bye}. Come back soon."
      render :new
    end

  end

end
