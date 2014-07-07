class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session_create
      redirect_to lists_path
      flash[:notice] = "You have successfully signed up!"
    else
        render :new
    end
  end

protected
  def user_params
    params.require(:user).permit(:name, :email, :password)
  end

end
