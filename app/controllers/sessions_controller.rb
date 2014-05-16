class SessionsController < ApplicationController
  
  include SessionsHelper

  def new
     @user = User.new
  end

  def create
    @user = User.where(:email => params[:session][:email]).first

    if @user && @user.authenticate(params[:session][:password])
      session[:remember_token] = @user.id
      @current_user = @user
      redirect_to items_path, notice: "You have successfully logged in."
    else
      flash.now[:notice] = "Invalid login/password combination. Please try again."
      render :new
    


    end

  end

  def destroy
    session.delete(:remember_token)
    redirect_to :root
  end

end
