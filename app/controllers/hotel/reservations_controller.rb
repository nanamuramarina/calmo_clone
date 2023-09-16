class Hotel::ReservationsController < ApplicationController
  before_action :current_hotel, except: [:index]
  before_action :set_current_hotel

  def index
    @reservations = Reservation.where(menu_id: Menu.where(hotel_id: current_hotel))
  end

  def show
    @reservation = Reservation.find(params[:id])
  end

  def update
    reservation = Reservation.find(params[:id])
    #byebug
    if reservation.update(status: params[:reservation][:status].to_i)
      #redirect_to hotel_menus_reservation_path(reservation.id)
       @reservation = reservation
      render :show
    else
      #@reservation = reservation
      render :show
    end
  end

  private
  def reservation_params
    #byebug
    params.require(:reservation).permit(:status)
  end

  def set_current_hotel
  end

end
