class Hotel::ReservationsController < ApplicationController
  before_action :current_hotel?, except: [:index]
  before_action :set_current_hotel

  def index
    @reservations = Reservation.where(menu_id: Menu.where(restaurant_id: @current_hotel))
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    reservation = Reservation.find(params[:id])
    if reservation.update(reservation_params)
      redirect_to public_reservations_path
    else
      @reservation = reservation
      render :show
    end
  end

  private
  def reservation_params
    params.require(:reservation).permit(:reservation_status)
  end

end
