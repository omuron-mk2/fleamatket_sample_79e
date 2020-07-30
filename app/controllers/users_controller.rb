class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
  end

  def create
    @user = User.new(user_params)
    if @user.save
      redirect_to root_path
    else
      render :create
    end
  end

  def edit
    @user = User.find(current_user.id)
  end

  def update
    if current_user.update!(user_params)
      redirect_to root_path
      # redirect_to user_path(current_user.id)
    else
      render :edit
    end
  end

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :profile_text)
  end
end
