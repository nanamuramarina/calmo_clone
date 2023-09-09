class Hotel::ReservationsController < ApplicationController
  def after_sign_up_path_for(resource)
     mypage_path
  end

  protected
  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number, :post_code, :address, :email ])
 
  end
end
