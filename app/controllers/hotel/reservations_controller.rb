class Hotel::ReservationsController < ApplicationController
  before_action :current_hotel, except: [:index]
  before_action :set_current_hotel

  def index
    @reservations = Reservation.where(menu_id: Menu.where(hotel_id: current_hotel))
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def edit
    @reservation = Reservation.find(params[:id])
  end

  def update
  @reservation = Reservation.find(params[:id])

  if @reservation.update(status: params[:reservation][:status].to_i)
    flash[:notice] = "更新が成功しました"
    render :show 
  else
    flash[:alert] = "更新が失敗しました"
    render :edit
  end
end

  private
  def reservation_params
    params.require(:reservation).permit(:status)
  end

  def set_current_hotel
  end

end
