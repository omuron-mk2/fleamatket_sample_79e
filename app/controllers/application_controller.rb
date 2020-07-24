class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?

  private
  def configure_permitted_parameters
    added_attrs = [ :nickname,
                    :last_name,
                    :first_name,
                    :last_name_kana,
                    :first_name_kana,
                    :birth_year,
                    :birth_month,
                    :birth_day,
                    :tel_number
                  ]
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
    devise_parameter_sanitizer.permit :sign_in, keys: added_attrs
  end
end