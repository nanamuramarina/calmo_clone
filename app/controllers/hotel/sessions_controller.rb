class Hotel::SessionsController < Devise::SessionsController
   before_action :customer_state, only: [:create]

  def after_sign_in_path_for(resource)
     root_path
  end

  def after_sign_out_path_for(resource)
     root_path
  end

  protected
  def customer_state
    @customer = Customer.find_by(email: params[:customer][:email])
    if @customer
      if @customer.valid_password?(params[:customer][:password]) && (@customer.is_valid == false)
         flash[:alert] = "退会済みです。再度ご登録をしてご利用ください。"
         redirect_to new_customer_registration_path
      else

      end
    end
  end


end