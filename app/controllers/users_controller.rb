class UsersController < ApplicationController
  def show
    @user = User.find(current_user.id)
    @selling_items = @user.selling_items.order("created_at DESC")
    @sold_items = @user.sold_items.order("created_at DESC")
    @bought_items = @user.bought_items.order("created_at DESC")

    respond_to do |format|
      format.html
      format.json { render json: @user}
    end
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
    respond_to do |format|
      format.html
      format.json { render json: @user}
    end
  end

  def update
    if current_user.update(user_params)
      flash[:notice] = 'プロフィールを編集しました。'
      redirect_to user_path(current_user.id)
    else
      flash.now[:alert] = 'プロフィールを編集できませんでした。'
      render :edit
    end
  end

  def exhibition
    @user = User.find(current_user.id)
  end

  def purchase
    @user = User.find(current_user.id)
  end

  private

  def user_params
    params.require(:user).permit(:nickname, :profile_image, :profile_text)
  end

  def update_resource(user_params)
    current_user.update_without_password(user_params)
  end
end
