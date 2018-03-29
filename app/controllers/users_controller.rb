class UsersController < ApplicationController
  def new
    @user = User.new
  end

  def create
    user = User.new(user_params)
    if user.save
      redirect_to '/register/success'
    else
      flash[:error] = 'There was an error creating your account'
      render :new
    end
  end

  def success
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :password)
  end
end
