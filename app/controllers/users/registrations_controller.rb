# frozen_string_literal: true

class Users::RegistrationsController < Devise::RegistrationsController
  # before_action :configure_sign_up_params, only: [:create]
  # before_action :configure_account_update_params, only: [:update]

  layout 'no_header_footer', except: [:edit, :edit_address, :show]

  def new
    @user = User.new
  end

  def new_address
    @address = Address.new
  end

  def create
    @user = User.new(sign_up_params)
    unless @user.valid?
      flash.now[:alert] = @user.errors.full_messages
      render :new and return
    end
    session["devise.regist_data"] = {user: @user.attributes}
    session["devise.regist_data"][:user]["password"] = params[:user][:password]
    @address = @user.build_address
    render :new_address
  end

  def create_address
    @user = User.new(session["devise.regist_data"]["user"])
    @address = Address.new(address_params)
    unless @address.valid?
      flash.now[:alert] = @address.errors.full_messages
      render :new_address and return
    end
    @user.build_address(@address.attributes)
    @user.save
    session["devise.regist_data"]["user"].clear
    sign_in(:user, @user)
  end

  def edit_address
    user = User.find(current_user.id)
    @address = user.address
  end

  def update_address
    if current_user.address.update(address_params)
      flash[:notice] = '送り先情報を変更しました。'
      redirect_to user_path(current_user.id)
    else
      flash[:alert] = '送り先情報を変更できませんでした。'
      redirect_to "/users/addresses/#{current_user.id}/edit"
    end
  end

  def show
    @user = User.find(current_user.id)
    @address = @user.address
  end



  # GET /resource/edit
  # def edit
  #   super
  # end

  # PUT /resource
  # def update
  #   super
  # end

  # DELETE /resource
  # def destroy
  #   super
  # end

  # GET /resource/cancel
  # Forces the session data which is usually expired after sign
  # in to be expired now. This is useful if the user wants to
  # cancel oauth signing in/up in the middle of the process,
  # removing all OAuth session data.
  # def cancel
  #   super
  # end

  protected

  def address_params
    params.require(:address).permit(:send_last_name, :send_first_name, :send_last_name_kana, :send_first_name_kana, :postal_code, :prefecture_id, :city, :house_number, :room_number)
  end


  # # If you have extra params to permit, append them to the sanitizer.
  # def configure_sign_up_params
  #   devise_parameter_sanitizer.permit(:sign_up, keys: [:attribute])
  # end

  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  def after_update_path_for(resource)
    user_path(resource)
  end

  # def update_resource(resource, params)
  #   resource.update_without_password(params)
  # end

  # If you have extra params to permit, append them to the sanitizer.
  # def configure_account_update_params
  #   devise_parameter_sanitizer.permit(:account_update, keys: [:attribute])
  # end

  # The path used after sign up.
  # def after_sign_up_path_for(resource)
  #   super(resource)
  # end

  # The path used after sign up for inactive accounts.
  # def after_inactive_sign_up_path_for(resource)
  #   super(resource)
  # end
end