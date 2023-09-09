class Hotel::HotelsController < ApplicationController
  before_action :set_hotel, only: [:mypage, :edit, :update, :withdraw]

  def hotel_mypage
    @hotel = current_hotel
  end

  def edit
    @hotel = current_hotel
  end

  def update
   if current_hotel.update(hotel_params)
     redirect_to hotel_mypage_path
   else
     redirect_to holel_infomation_path
   end
  end

  def hotel_confirm_withdraw
  end

  def hotel_withdraw
    current_hotel.update(is_valid: false)
    reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end

  private
  def hotel_params
    params.require(:hotel).permit(:name, :email, :post_code, :address, :phone_number)
  end

  def set_hotel
    @hotel = Hotel.find_by(params[:email])
  end

end
